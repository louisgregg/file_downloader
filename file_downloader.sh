#!/bin/bash
if [ $# -ne 2 ]; then
    echo $0: Usage: file_downloader.sh url extension 
    echo 'Example: file_downloader.sh example.com pdf' 
    exit 1
fi

url=$1
extension=$2
relative_links=$(curl $url | grep $extension | sed 's/[^"]*"\([^"]*\).*/\1/')

if [[ $relative_links == *"http"* ]]
then
	absolute_links=$relative_links
else
	base_url=$(dirname $url)
	absolute_links=$(echo "$relative_links" | sed 's,^,'"$base_url"'/,')
	echo -e '\nThe links found were relative and the base URL has been appended.'
	echo -e 'base url: '$base_url'\n'
fi

echo 'The following links to '$extension' files were found:'
echo -e "$absolute_links\n"

echo "Do you wish to download these files?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "$absolute_links" |parallel --gnu "wget {}"; break;;
        No ) exit;;
    esac
done