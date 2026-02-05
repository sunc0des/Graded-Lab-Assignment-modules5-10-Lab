#!/bin/bash

# Convert all words to lowercase
tr 'A-Z' 'a-z' < words.txt > temp.txt

# Words with ONLY vowels
grep -E '^[aeiou]+$' temp.txt > vowels.txt

# Words with ONLY consonants
grep -E '^[^aeiou]+$' temp.txt > consonants.txt

# Words with both vowels and consonants AND starting with a consonant
grep -E '^[^aeiou][a-z]*[aeiou][a-z]*$' temp.txt > mixed.txt

rm temp.txt

echo "Pattern classification completed."

