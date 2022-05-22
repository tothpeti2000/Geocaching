#!/bin/bash

awk '
    BEGIN {
        FS = ">"
    }

    { print $2 >> "files/coordinates" }
' files/tagCoordinates