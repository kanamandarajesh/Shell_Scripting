#!/bin/bash

echo -n "Enter zip file name: "
read zip_name
for zip_files in "*.sh"; do
    echo "zip log files"
        zip "$zip_name" "$zip_files"
done
