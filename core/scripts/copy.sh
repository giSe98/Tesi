#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 \"<month day hh:mm>\" \"<path dir to copy blobs>\""
    exit -1
fi

dir="/home/test/.cache/midori/WebKitCache/Version 16/Blobs/"
for i in $(ls -l "$dir" | grep "$1" | grep -Eo '[0-9a-fA-F]{40}'); do
    cp "$dir"$i $2
done