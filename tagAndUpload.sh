#!/bin/bash

CLUSTER_NAME=mycluster.icp
NAMESPACE=default

while IFS='' read -r line || [[ -n "$line" ]]; do
    	echo "Text read from file: $line"
    	docker tag $line $CLUSTER_NAME:8500/$NAMESPACE/$line
	docker push $CLUSTER_NAME:8500/$NAMESPACE/$line
done < "$1"
