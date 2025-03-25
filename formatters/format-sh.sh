#!/bin/bash

# Script to format shell scripts using shfmt if available,
# or a basic formatting approach if shfmt is not installed

# Check if shfmt is available
if command -v shfmt &> /dev/null; then
	echo "Using shfmt to format shell scripts"
	find . -name "*.sh" -type f -exec shfmt -i 4 -bn -ci -sr -w {} \;
else
	echo "shfmt not found, using basic formatting for shell scripts"
	# Process each .sh file with a basic formatter
	find . -name "*.sh" -type f | while read -r file; do
		echo "Formatting $file"

		# Create a temporary file
		tmp_file="${file}.tmp"

		# Process the file:
		# First, apply basic spacing and variable fixes
		cat "$file" |
			expand -t 4 |
			# Fix variable assignments to have consistent spacing
			sed -E "s/([A-Za-z0-9_]+)[ ]*=[ ]*/\1=/g" |
			# Remove trailing whitespace
			sed "s/[ \t]*$//g" > "$tmp_file"

		# Since shell script formatting is complex, we"ll recommend using shfmt
		# for more advanced formatting. For now, we"ll just ensure consistent
		# spacing and tabs for indentation.
		cat "$tmp_file" |
			# Convert leading spaces to tabs (4 spaces=1 tab)
			unexpand -t 4 --first-only |
			# Add final newline
			sed -e "$a\" > "${tmp_file}.2"

		# Replace the original file with the formatted one
		mv "${tmp_file}.2" "$file"
		rm -f "$tmp_file"
	done

	echo "Consider installing shfmt for better shell script formatting:"
	echo "  - On NixOS: nix-env -iA nixpkgs.shfmt"
	echo "  - Add to configuration.nix: environment.systemPackages=[ pkgs.shfmt ];"
fi

echo "All shell scripts formatted successfully"
