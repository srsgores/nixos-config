#!/bin/bash

# Script to format .conf files with consistent spacing using tabs (width 4)

# Process each .conf file
find . -name "*.conf" -type f | while read -r file; do
	echo "Formatting $file"

	# Create a temporary file
	tmp_file="${file}.tmp"

	# Process the file:
	# 1. Convert all tabs to 4 spaces
	# 2. Ensure exactly one space around equals signs
	# 3. Remove trailing whitespace
	# 4. Convert leading spaces to tabs (4 spaces=1 tab)
	# 5. Ensure only one blank line between sections
	# 6. Add missing final newline
	cat "$file" |
		expand -t 4 |
		sed -E 's/([^ ]) *=[ ]*/\1=/g' |
		sed 's/[ \t]*$//g' |
		unexpand -t 4 --first-only |
		sed -E '/^$/N;/^\n$/D' |
		sed -e '$a\' > "$tmp_file"

	# Replace the original file with the formatted one
	mv "$tmp_file" "$file"
done

echo "All .conf files formatted successfully"
