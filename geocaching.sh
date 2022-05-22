#!/bin/bash

./scripts/curl.sh $1

./scripts/parseAnchorTags.sh
if [ $? -eq 1 ]
then
    exit 1
fi

./scripts/getLinks.sh
./scripts/getTreasures.sh
./scripts/getCoordinates.sh

while [ $(cat files/links | wc -l) != 0 ]
do
    link=$(head -1 files/links)
    sed -i "1d" files/links

    ./scripts/curl.sh $link

    ./scripts/parseAnchorTags.sh
    
    if [ $? -eq 1 ]
    then
    ./scripts/printResults.sh
        exit 1
    fi

    ./scripts/getLinks.sh
    ./scripts/getTreasures.sh
    ./scripts/getCoordinates.sh
done
