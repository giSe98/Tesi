#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 \"<name_of_process>\""
    exit -1
fi

pid=$(ps ax | grep "$1" | cut -d " " -f3)
kill $pid
