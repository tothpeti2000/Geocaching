#!/bin/bash

paste files/treasures files/coordinates > files/results

echo -e "\nGeocaching results\n"
echo -e "Treasures found:" $(cat files/results | wc -l) "\n"

cat -n files/results