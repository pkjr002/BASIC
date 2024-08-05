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

## Archive directory: `tar` (Tape Archive)   
Purpose: **Bundle Together** `files/folders` preserving directory structure and metadata.
Tool that groups multiple files and folders into a single file. Note, it does not compress to save space. Originally created to write data to tape drives, its uses mainly involve:   
* __Archiving__: tar can bundle many files and directories into a single file, making it easier to transfer or backup.
* __Preserving Structure__: It preserves the directory structure and metadata (like permissions and timestamps) of the files and directories it archives.
* __Compression__: While tar itself does not compress files, it is often used in combination with compression tools like `gzip` or `bzip2` to both archive and compress files in one step.  

`Create` an archive:   
Create a compressed tarball of the contents of `/path/to/the/folder/archive`
```
tar -cvf archive.tar -C /path/to/the/folder archive
```  
*Flags:*  
`-c`: Create a new archive.    
`-v`: Verbose mode, which lists files being processed.    
`-f archive.tar`: Specify the name of the output `*.tar` file.     
`-C /path/to/the/folder`: Change to the specified directory before performing the operation.      
`archive`: The directory to include in the `archive.tar`.    



`Extract` an archive: 
```
tar -xvf archive.tar 
```

*Flags:*  
`-x` extracts the archive,  
 


## File Compression 
This is used so that files take up less space on your computer. Here are some benefits of Compression:   
- [x] Reduced Data Transfer: Compressing data before transfer reduces the total amount of data sent over the network.
- [x] Increased Speed: Less data to transfer can lead to faster transfers, particularly over slower network connections.
- [x] Bandwidth Efficiency: Compression makes better use of available network bandwidth, which can be critical in bandwidth-constrained environments.

Some of the most popular compression tools are:
1. `Gzip`: It's faster at compressing files (_might not reduce the file size as much as Bzip2_).  
    - compress `tar -cvzf archive.tar.gz -C /path/to/the/folder archive`   
    - extract `tar -xvzf archive.tar.gz -C /path/to/extract`
    
1. `Bzip2`: It takes more time to compress files (_usually makes them even smaller than Gzip_).    
    - compress `tar -cvjf archive.tar.bz2 -C /path/to/the/folder archive`    
    - extract  `tar -xvjf archive.tar.bz2 -C /path/to/extract`    

> Note the *Flags:*   
`-z` for `gzip`  
`-j` for `bzip2`.     

<br>

### Parallel Compression Tools   
These tools can significantly speed up the compression and decompression processes by utilizing the full capabilities of modern multi-core processors.  
1. **pigz**: Parallel gzip, faster compression using multiple CPU cores.
1. **pxz**: Parallel xz, higher compression ratios with multi-core support.
1. **pbzip2**: Parallel bzip2, good balance between compression ratio and speed.
1. **plzip**: Parallel lzip, based on the LZMA algorithm for efficient compression.

A method that has proven to be optimal with `.gz` is `pigz`. 
```
tar -cvf - /path/to/source | pigz > archive.tar.gz  
```  

<br>

## List Contents of `*tgz` without uncompressing.       
`tar -tzvf filename.tgz`   
`-t`: List the contents of an archive.


<br><br>

## File compare   

`diff -qr /path/to/directory1 /path/to/directory2`    tool to compare the contents of two directories   

<br>

To compare the contents of two `.tgz` files without extracting them to disk,
```
file1="/somefile.tgz"
file2="/otherfile.tgz"

diff <(tar -tf "${file1}" | sort) <(tar -tf "${file2}" | sort)
```



## Permissions  

`chmod -x filename.sh`  make script executable.  

```  
chmod 755 
```    
This command changes the permissions of the directory so that:

The owner of the directory has read, write, and execute permissions (7).
Members of the directory's group have read and execute permissions (5).
Other users have read and execute permissions (5).


## VARIABLES    
`$` used for Variable Substitution: `$exp_path`   
`$()` used for Command Substitution: `$(command)` executes `command` and substitutes its output.    
`${}` basic syntax for referencing the value of a variable in Bash. `${exp_path}.   
```

```  

## Pattern Removal Operator
`${variable#pattern}`: Removes the shortest match of pattern from the beginning of variable.  
`${variable##pattern}`: Removes the longest match of pattern from the beginning of variable.  
`${variable%pattern}`: Removes the shortest match of pattern from the end of variable.  
`${variable%%pattern}`: Removes the longest match of pattern from the end of variable.    


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

<br>
---  

# Need to rewrite.  

```
#!/bin/bash

# Find and delete for file
find  /projects/kopp/facts-experiments/221217/coupling.ssp119/output/ -type f -name '*quantile*' -exec rm {} \;
find   -type f -name '*quantile*' -exec rm {} \;
# For folder
find . -type d -name '*1*' -exec rm -r {} \;



# The & at the end of a command makes the command run in the background.

dt=`date +%s`           # Create an epoch Timestamp
date -d @1667496124     # Convert Back.



# Parenthesis used to wrap around the command
pd=$(pwd)

rm slurm* ; rm test.* ; rm -r /scratch/pk695/test.*

: << 'code'
file="file_you_want_to_delete"
if [ -f "$file" ] ; then
    rm "$file"
fi
code


ls -alh

du -csxh  # Disk Useage

# Tar a file
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file



# if you want to have both stderr and output displayed on the console and in a file use this:
SomeCommand 2>&1 | tee SomeFile.txt
(If you want the output only, drop the 2 above)
``` 
