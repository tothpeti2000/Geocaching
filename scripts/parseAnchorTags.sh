#!/bin/bash

numOfGeocacheTags=$(awk '
    BEGIN {
        RS = "<"
        numOfGeocacheTags = 0
    }
    
    /^a[ \t\n]+/ {
        isGeocache = 0

        for(i = 0; i < NF; i++){
            if($(i+1) ~ /^class="geocache"/) {
                isGeocache = 1
                print > "files/tags"
            }
        }

        if(isGeocache) {
            for(i = 0; i < NF; i++){
                if($(i+1) ~ /^href/){
                    print $(i+1) > "files/hrefs"
                }

                if($(i+1) ~ /^data-treasure/){
                    print $(i+1) > "files/dataTreasures"
                }

                if($(i+1) ~ /^>/){
                    print $(i+1) > "files/tagCoordinates"
                }
            }

            numOfGeocacheTags++
        }
    }

    END {
        print numOfGeocacheTags
    }
' files/html)

echo $numOfGeocacheTags
if [ $numOfGeocacheTags -eq 0 ]
then
    exit 1
fi