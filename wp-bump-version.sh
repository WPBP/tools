#!/bin/bash
shopt -s nullglob

echo "WP Version Changer 2.0 by Mte90 & deshack"

if [ "$1" == "-h" ] || [ $# -eq 0 ]; then
	echo "Change the version in a wordpress plugin ('pluginrootfile'.php and README.txt)"
	echo "Usage: [path] [version]"
	echo "-h: this help"
	exit 0
fi

cd "$1"

if [ -f 'README.txt' ]; then
	LINE=$(sed -n '/Stable tag: /{=}' README.txt)
	sed -i "${LINE}s/.*/Stable tag: ${2}/" README.txt
else
	echo "Missing README.txt"
fi

rootfile=$(ls "${1}"*.php | head -1)
if [ -f "$rootfile" ]; then
    constant=$(grep "_VERSION" "$rootfile" | awk -F "'" '{print $2}')
    LINE=$(sed -n "/$constant/{=}" "$rootfile")
    spaces=$(sed -n ${LINE}p "$rootfile" | awk -F "define" '{print $1}')
    sed -i "${LINE}s/.*/${spaces}define( '${constant}', '${2}' );/" "$rootfile"
    LINE=$(sed -n '/ * Version:/{=}' "$rootfile")
    sed -i "${LINE}s/.*/ * Version:           ${2}/" "$rootfile"
else
	echo "Missing PHP file in the folder"
fi

echo "  Done! YOORAH!"
