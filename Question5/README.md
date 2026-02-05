Question 5

This folder contains:
- sync.sh
- dirA (with files)
- dirB (with files)
- Screenshots



- Explanations for each command:

Command:
mkdir dirA dirB

Explanation:
This command creates two directories for comparison.

Command:
nano dirA/file1.txt

Explanation:
This command creates a sample file in dirA.

Command:
nano dirB/file1.txt

Explanation:
This command creates a sample file in dirB.

Command:
nano sync.sh

Explanation:
This command creates the shell script used to compare directories.

Command:
chmod +x sync.sh

Explanation:
This command gives execute permission to the script.

Command:
./sync.sh

Explanation:
This command runs the script and displays files unique to each directory and compares common files.

