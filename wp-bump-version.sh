#!/bin/bash
set -e

echo "WP Boilerplate Version Changer 1.1.1 by Mte90 & deshack"

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

rootfiles=( "${1}/*.php" )
rootfile="${rootfiles[0]}"

LINE=$(sed -n '/PN_VERSION/{=}' "$rootfile")
sed -i "${LINE}s/.*/define( 'PN_VERSION', '${2}' );/" "$rootfile"
LINE=$(sed -n '/ * Version:/{=}' "$rootfile")
sed -i "${LINE}s/.*/ * Version:           ${2}/" "$rootfile"

echo "Done! YOORAH!"
