#!/usr/bin/env bash
# Renders the repo graphics from the HTML sources with headless Chrome, then assembles the GIF with Pillow.
# Usage: bash assets/build/render.sh [path-to-headshot.png]
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
B="$ROOT/assets/build"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
AVATAR="${1:-}"

render () { # html, width, height, scale, out, [query]
  local html="$1" w="$2" h="$3" s="$4" out="$5" q="${6:-}"
  "$CH" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor="$s" \
    --window-size="$w,$h" --virtual-time-budget=8000 --screenshot="$out" "file://$B/$html$q" >/dev/null 2>&1
}

AQ=""
if [ -n "$AVATAR" ]; then cp "$AVATAR" "$B/avatar.png"; AQ="&avatar=avatar.png"; fi

mkdir -p "$ROOT/assets/linkedin"
echo "team @2x"; render team.html 720 900 2 "$ROOT/assets/linkedin/grokbot-delivery-team-light@2x.png" "?all=1$AQ"
echo "org chart @2x"; render org-chart.html 2000 1125 2 "$ROOT/assets/org-chart@2x.png" "?x=1$AQ"
echo "engagement map @2x"; render engagement-map.html 1600 720 2 "$ROOT/assets/engagement-map@2x.png"

echo "gif frames"
mkdir -p "$B/frames"; rm -f "$B/frames"/*.png
for i in $(seq 0 13); do render team.html 720 900 1 "$B/frames/team-$(printf %02d $i).png" "?frame=$i&bar=0$AQ"; done
render team.html 720 900 1 "$B/frames/team-14.png" "?frame=13$AQ"

python3 - "$B/frames" "$ROOT/assets/linkedin/grokbot-delivery-team-light.gif" <<'EOF'
import sys, glob
from PIL import Image
frames_dir, out = sys.argv[1], sys.argv[2]
paths = sorted(glob.glob(f"{frames_dir}/team-*.png"))
imgs = [Image.open(p).convert("RGB").quantize(colors=200, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE) for p in paths]
durations = [900] + [260] * (len(imgs) - 2) + [3200]
imgs[0].save(out, save_all=True, append_images=imgs[1:], duration=durations, loop=0, optimize=True)
print("gif", out, len(imgs), "frames")
EOF
ls -la "$ROOT/assets"
