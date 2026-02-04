#!/bin/bash

# Extract valid emails
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > valid.txt

# Remove duplicates from valid emails
sort valid.txt | uniq > temp.txt
mv temp.txt valid.txt

# Extract invalid emails
grep -v -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

echo "Email cleaning completed."

