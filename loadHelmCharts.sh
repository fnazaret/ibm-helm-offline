#!/bin/bash

    	
for filename in ./helm-repos/*.tgz; do
	echo "Filename: $filename"
	bx pr load-helm-chart --archive $filename
done 
