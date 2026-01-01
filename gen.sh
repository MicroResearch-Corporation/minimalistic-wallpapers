#!/bin/bash

# Configuration
IMG_DIR="Img"
OUTPUT="list.json"

echo "[" > $OUTPUT

# Find images, get size and unix date, then format as JSON
find "$IMG_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.avif" \) -printf '  {\n    "name": "%f",\n    "path": "%p",\n    "size": %s,\n    "date": %T@\n  },\n' | sed '$ s/,$//' >> $OUTPUT

echo "]" >> $OUTPUT

# Clean up decimal points in timestamps (fix for bash printf)
sed -i 's/\.[0-9]*//g' $OUTPUT

echo "Done! Generated $OUTPUT"
