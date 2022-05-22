#!/bin/bash

awk '
    BEGIN {
        FS = "\""
    }

    { print $2 >> "files/treasures" }
' files/dataTreasures