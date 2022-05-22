#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Please, provide a page to get the HTML content of!"
    exit 1
fi

echo -e "\nFetching from " $1

# Get the HTML content of the given page
curl $1 > files/html