#!/bin/bash
if [ $# -lt 2 ]; then
    echo $0: 'Usage: file_downloader.sh url extension1 extension2 ... '
    echo 'Example: bash file_downloader.sh example.com pdf jpg' 
    exit 1
fi

url=$1
shift
old="$IFS"
IFS=','
extensions="'$*'"
echo 'extensions to be retrieved are: '"$extensions"
IFS=$old

wget --accept "$(extensions)" --mirror --progress=bar --adjust-extension --convert-links --backup-converted --no-parent -nd $url