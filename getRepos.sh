#!/bin/bash

echo "Pulling repositories";
local images="";
while IFS='' read -r line || [[ -n "$line" ]]; do
	echo "pulling image $line"
      	docker pull $line
      	images="$images $line"
done < "$1"

echo -e "\nGenerating x86_64 offline package, this may take a while.\n"

echo $images;

# save all appended container names within images into a .tar
docker save -o ICP-EE-2.1.0.2.tar $images

# compress it into gz
tar zcf ICP-EE-2.1.0.2.tar.gz ICP-EE-2.1.0.2.tar

# delete the .tar file
rm -f ICP-EE-2.1.0.2.tar
