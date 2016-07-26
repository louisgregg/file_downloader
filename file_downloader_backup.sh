#!/bin/bash
if [ $# -ne 2 ]; then
    echo $0: Usage: file_downloader.sh url extension 
    echo 'Example: file_downloader.sh example.com pdf' 
    exit 1
fi

url=$1
extension=$2

relative_links=$(curl $url | grep $extension | sed 's/[^"]*"\([^"]*\).*/\1/')
#relative_links=$(curl $url | grep $extension)
echo "$relative_links"

if [[ $relative_links == *"http"* ]]
then
	echo "These links are absolute";
	absolute_links=$relative_links
else
	base_url=$(dirname $url)
	echo $base_url
	absolute_links=$(echo "$relative_links" | sed 's,^,'"$base_url"'/,')
	echo 'The absolute links are:'
	echo "$absolute_links"
fi

echo "Do you wish to download these files?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "$absolute_links" |parallel --gnu "wget {}"; break;;
        No ) exit;;
    esac
done