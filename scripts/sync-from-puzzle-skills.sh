#!/usr/bin/env bash
# Refresh the skills this repo shares with puzzle-skills from a sibling checkout,
# keeping the delivery team's preamble (context/skill-preambles/<name>.md) under the frontmatter.
# Usage: scripts/sync-from-puzzle-skills.sh [path-to-puzzle-skills]   (default: ../puzzle-skills)
set -euo pipefail
cd "$(dirname "$0")/.."
SRC="${1:-../puzzle-skills}/skills"
for name in read-the-map build-puzzle-process interview-for-a-process log-a-decision cost-a-process find-automation-opportunities; do
  src="$SRC/$name/SKILL.md"; pre="context/skill-preambles/$name.md"; dst="skills/$name/SKILL.md"
  [ -f "$src" ] || { echo "missing $src" >&2; exit 1; }
  [ -f "$pre" ] || { echo "missing $pre" >&2; exit 1; }
  mkdir -p "skills/$name"
  # frontmatter: through the second '---' line
  awk 'NR==1{print; next} {print} /^---$/ {exit}' "$src" > "$dst"
  { echo; cat "$pre"; awk 'f{print} /^---$/ && NR>1 {f=1}' "$src"; } >> "$dst"
  echo "synced skills/$name/SKILL.md"
done
