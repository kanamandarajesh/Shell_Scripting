#!/bin/bash

while true; do
    current_minute=$(date +%M)

    if [ "$current_minute" == "05" ]; then
        echo '05 Min';
        ./nswiftn.sh;
    fi

    if [ "$current_minute" == "36" ]; then
        echo '36 Min';
        ./day.sh;
    fi

    sleep 30
done
