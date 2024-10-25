#!/usr/bin/env bash

# Check if a directory path was provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a directory path as an argument."
    exit 1
fi

directory_path=$1

for file in "$directory_path"/*.srt; do
    if [ -f "$file" ]; then
        echo "Converting $file to UTF-8..."
        iconv -f ISO-8859-15 -t UTF-8 "$file" > "${file%.srt}_fr.srt" && 
        rm "$file" &&
        mv "${file%.srt}_fr.srt" "$file"
    fi
done

echo "All conversions completed."
