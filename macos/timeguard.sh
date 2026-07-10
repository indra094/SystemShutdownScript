#!/bin/bash

while true
do

HOUR=$(date +%H)

if [ "$HOUR" -lt 09 ] || [ "$HOUR" -ge 17 ]; then

    shutdown -h now

fi

sleep 60

done
