#!/bin/bash

# Convert text to lowercase, remove punctuation, and split into words
words=$(tr 'A-Z' 'a-z' < input.txt | tr -c 'a-z\n' ' ' | tr ' ' '\n')

# Longest word
longest=$(echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | awk '{print $2}')

# Shortest word
shortest=$(echo "$words" | awk 'NF { print length, $0 }' | sort -n | head -1 | awk '{print $2}')

# Average word length
avg=$(echo "$words" | awk '{ total+=length; count++ } END { print total/count }')

# Unique word count
unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Total unique words: $unique"

