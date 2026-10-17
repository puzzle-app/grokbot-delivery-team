#!/usr/bin/env bash
# Renders the dark LinkedIn version of the team reveal: a 1080x1350 still at 2x, a GIF, and an MP4 with cross-fades.
# Usage: bash assets/build/render-linkedin.sh [path-to-headshot.png]
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
B="$ROOT/assets/build"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
AVATAR="${1:-}"
AQ=""; if [ -n "$AVATAR" ]; then cp "$AVATAR" "$B/avatar.png"; AQ="&avatar=avatar.png"; fi

render () { local html="$1" w="$2" h="$3" s="$4" out="$5" q="${6:-}"
  "$CH" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor="$s" \
    --window-size="$w,$h" --virtual-time-budget=8000 --screenshot="$out" "file://$B/$html$q" >/dev/null 2>&1; }

echo "still @2x"; render team-dark.html 1080 1350 2 "$ROOT/assets/linkedin/grokbot-delivery-team-dark@2x.png" "?all=1$AQ"

echo "frames"
F="$B/frames-dark"; mkdir -p "$F" "$ROOT/assets/linkedin"; rm -f "$F"/*.png
for i in $(seq 0 13); do render team-dark.html 1080 1350 1 "$F/k-$(printf %02d $i).png" "?frame=$i&bar=0$AQ"; done
render team-dark.html 1080 1350 1 "$F/k-14.png" "?frame=13$AQ"

python3 - "$F" "$ROOT/assets/linkedin/grokbot-delivery-team-dark.gif" "$F/frames.txt" <<'EOF'
import sys, glob, os
from PIL import Image
F, gif_out, list_out = sys.argv[1], sys.argv[2], sys.argv[3]
keys = sorted(glob.glob(f"{F}/k-*.png"))
imgs = [Image.open(p).convert("RGB") for p in keys]

# GIF: key frames only, keeps the file small
q = [im.quantize(colors=160, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE) for im in imgs]
durations = [1000] + [240] * (len(q) - 2) + [3500]
q[0].save(gif_out, save_all=True, append_images=q[1:], duration=durations, loop=0, optimize=True)
print("gif", gif_out, len(q), "frames")

# MP4 frame list: hold each key frame, cross-fade to the next over 6 frames at 30 fps
lines = []
FADE = 6; STEP = 33
def hold(path, ms): lines.append(f"{path} {ms}")
hold(keys[0], 900)
for i in range(1, len(keys)):
    a, b = imgs[i-1], imgs[i]
    for k in range(1, FADE + 1):
        t = k / (FADE + 1)
        fr = Image.blend(a, b, t)
        p = f"{F}/x-{i:02d}-{k}.png"; fr.save(p); hold(p, STEP)
    hold(keys[i], 3200 if i == len(keys) - 1 else 220)
open(list_out, "w").write("\n".join(lines) + "\n")
print("mp4 list", len(lines), "frames")
EOF

echo "mp4"
swift "$B/encode-mp4.swift" "$F/frames.txt" "$ROOT/assets/linkedin/grokbot-delivery-team-dark.mp4" 1080 1350 30
ls -la "$ROOT/assets/linkedin"
