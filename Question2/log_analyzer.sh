#!/bin/bash

# Check argument count
if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one log file."
    exit 1
fi

# Check if file exists and is readable
if [ ! -r "$1" ]; then
    echo "Error: File does not exist or is not readable."
    exit 1
fi

echo "Log File Analysis"

total=$(wc -l < "$1")
info=$(grep -c " INFO " "$1")
warning=$(grep -c " WARNING " "$1")
error=$(grep -c " ERROR " "$1")

echo "Total entries: $total"
echo "INFO messages: $info"
echo "WARNING messages: $warning"
echo "ERROR messages: $error"

recent_error=$(grep " ERROR " "$1" | tail -1)
echo "Most recent ERROR:"
echo "$recent_error"

report="logsummary_$(date +%F).txt"

{
    echo "Log Summary Report"
    echo "Date: $(date)"
    echo "Total entries: $total"
    echo "INFO: $info"
    echo "WARNING: $warning"
    echo "ERROR: $error"
    echo "Most recent ERROR:"
    echo "$recent_error"
} > "$report"

echo "Report generated: $report"

