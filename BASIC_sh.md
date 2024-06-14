# A basic list of everything sh  
This will likely have to be split up moving forward, for now I am just populating. 

## Very useful shell commands  
```
uname -a .......................display detailed information about the system. 
env.............................used to display, set, or remove environment variables. Also to run a command in a modified environment without changing the current environment.
date............................Thu Jun 13 00:00:00 EDT 2024
echo $SHELL.....................Your shell
echo $HOST......................host
echo $USER......................user
du -xsch........................disk space
ls -ld..........................display detailed information about directories
```



## Permissions  
  
```  
chmod 755 
```    
This command changes the permissions of the directory so that:

The owner of the directory has read, write, and execute permissions (7).
Members of the directory's group have read and execute permissions (5).
Other users have read and execute permissions (5).




## Bash script to get tree-like representation of the directory structure  
First create a `.sh` script using `$ touch ls_tree.sh` and add the following.   
```
#!/bin/bash
directory=$1
output_file=$2
# Ensure the directory and output file are provided
if [ -z "$directory" ] || [ -z "$output_file" ]; then
  echo "Usage: $0 /path/to/directory output.txt"
  exit 1
fi
current_date=$(date +%Y-%m-%d)
output_file_with_date="${output_file}_${current_date}.txt"
# Find files and dir. Format them in a tree structure.
find "$directory" | awk 'BEGIN{FS="/"; OFS="|"} {
    depth = NF - 1
    for (i = 1; i <= depth; i++) {
        printf "|   "
    }
    if (depth > 0) {
        printf "+--- "
    }
    print $NF
}'> "$output_file_with_date"
```  
Make sure to make this executable by `chmod +x ls_tree.sh`  
Run the script using   
```
./ls_tree.sh /path/to/your/directory output.txt
```
