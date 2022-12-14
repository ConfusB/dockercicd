#!/bin/sh

# Bump version
CUR_VER="$(cat ./version.txt)"
echo $CUR_VER
NEW_VER=$(($CUR_VER + 1))  
echo $NEW_VER
echo $NEW_VER > version.txt 

# Set helm image
yq e -i ".image.tag=$NEW_VER" ./helm/hello-python/values.yaml