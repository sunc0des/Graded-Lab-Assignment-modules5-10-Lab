#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide a directory path."
    exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

echo "Script PID: $$"

mkdir -p "$dir/backup"

for file in "$dir"/*
do
    if [ -f "$file" ]; then
        mv "$file" "$dir/backup/" &
        echo "Moved $(basename "$file") in background. PID: $!"
    fi
done

wait
echo "All background move processes completed."

