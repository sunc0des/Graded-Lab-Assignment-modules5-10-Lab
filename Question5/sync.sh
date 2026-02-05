#!/bin/bash

dirA="dirA"
dirB="dirB"

echo "Files only in dirA:"
ls "$dirA" > a.txt
ls "$dirB" > b.txt
comm -23 <(sort a.txt) <(sort b.txt)

echo
echo "Files only in dirB:"
comm -13 <(sort a.txt) <(sort b.txt)

echo
echo "Comparing common files:"
for file in $(comm -12 <(sort a.txt) <(sort b.txt))
do
    if cmp -s "$dirA/$file" "$dirB/$file"; then
        echo "$file: Files are identical"
    else
        echo "$file: Files are different"
    fi
done

rm a.txt b.txt

