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

./geocaching.sh $(cat files/links)
