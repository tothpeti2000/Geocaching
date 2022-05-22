#!/bin/bash

awk '
    BEGIN {
        FS = "\""
    }

    { print $2 >> "files/links" }
' files/hrefs