Question 8

This folder contains:
- bg_move.sh
- file1.txt
- file2.txt
- file3.txt (and these docs contain in "backup" which is in the folder "testdir"
- Screenshots


- Explanations for each command:

- Command:
mkdir testdir

Explanation:
This command creates a directory to test background file movement.

Command:
nano bg_move.sh

Explanation:
This command creates the shell script that moves files in the background.

Command:
chmod +x bg_move.sh

Explanation:
This command gives execute permission to the script.

Command:
./bg_move.sh testdir

Explanation:
This command runs the script, moves files into a backup directory using background processes, and displays process IDs.

Command:
ls testdir/backup

Explanation:
This command verifies that all files were moved successfully.

