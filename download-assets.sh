#!/usr/bin/env bash
# Downloads all GitBook assets referenced by the docs into ./images/
# Run from the repo root. Requires the docs to still be live at docs.yellow.pro.
set -e
mkdir -p images
BASE="https://docs.yellow.pro/~gitbook/image?url="
while read -r id; do
  [ -z "$id" ] && continue
  # GitBook serves originals via the space file endpoint; try direct file first
  url="https://docs.yellow.pro/~gitbook/files/v0/b/$id"
  echo "Fetching $id ..."
  # Fallback chain: try a few known GitBook asset URL shapes
  curl -fsSL "https://docs.yellow.pro/~gitbook/image?url=$id" -o "images/$id" 2>/dev/null \
    || curl -fsSL "$url" -o "images/$id" 2>/dev/null \
    || echo "  ! could not fetch $id (grab manually from GitBook Library)"
done < ASSETS_MANIFEST.txt
echo "Done. Check images/ — rename any that need a .png/.gif extension."
