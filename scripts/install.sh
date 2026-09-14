#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 /path/to/agent/skills"
  exit 1
fi

TARGET="$1"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/skills"

mkdir -p "$TARGET"

for skill in \
  research-output \
  report-router \
  confluence-report \
  slack-report \
  report-lint
do
  rm -rf "$TARGET/$skill"
  cp -R "$SOURCE_DIR/$skill" "$TARGET/$skill"
  echo "Installed: $skill -> $TARGET/$skill"
done

echo
echo "Done."
echo "Optional external style skills such as fluent-korean are NOT installed by this script."
