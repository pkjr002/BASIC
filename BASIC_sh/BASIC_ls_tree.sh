#!/bin/bash
directory=$1
output_file=$2
# Ensure the directory and output file are provided
if [ -z "$directory" ] || [ -z "$output_file" ]; then
  echo "Usage: $0 /path/to/directory output.txt"
  exit 1
fi
current_date=$(date +%Y.%m.%d)
output_file_with_date="${current_date}_${output_file}"
# Find files and dir. Format them in a tree structure.
find "$directory" | awk 'BEGIN{FS="/"; OFS="|"} {
    depth = NF - 1
    if (depth == 1 && NR > 1) {
        printf "\n"
    }
    for (i = 1; i <= depth; i++) {
        printf "|   "
    }
    if (depth > 0) {
        printf "|--- "
    }
    print $NF
}'> "$output_file_with_date"