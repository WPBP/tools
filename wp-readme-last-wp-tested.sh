#!/usr/bin/env bash

echo "WP Tested up Version Changer 1.0 by Mte90"

if [ "$1" == "-h" ] || [ $# -eq 0 ]; then
	echo "Change the version in a wordpress plugin (README.txt)"
	echo "Usage: [path]"
	echo "-h: this help"
	exit 0
fi

if [ -f ${1} ]; then
	LINE=$(sed -n '/Tested up to: /{=}' ${1})
    lastwp=$(curl --silent "https://api.github.com/repos/wordpress/wordpress/tags" | jq -r '.[0].name')
	sed -i "${LINE}s/.*/Tested up to: ${lastwp}/" ${1}
else
	echo "Missing README.txt"
fi

echo "  Done! YOORAH!"
