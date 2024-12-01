#!/bin/bash
echo -n "Enter Zip Time: "
read time
# Loop through all .tar.xz files in the current directory
for file in *.tar.xz; do
        echo "Untaring $file..."
        tar -xJvf "$file"
done
