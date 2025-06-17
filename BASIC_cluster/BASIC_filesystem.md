# File system commands   

<br>  

`du -xsch` gives the Disk Useage    
*Flags*
`-x` one file system, `-s` summarize, `-c` total (summing the disk usage of all specified files and directories), `-h`  human-readable. 


`df -h`   disk space used and available on filesystems.   
`lsblk -f`   lists information about all available or the specified block devices.   
`mount | column -t`  shows all mounted filesystems.   


### Process monitoring
Using ps, get details of the processes running:   
```
ps -u $USER -o pid,ppid,psr,%cpu,%mem,command | grep python
```     
Note that the mem is in KB

If you want a more detailed output that converts memory to GB, use     
```
ps -u $USER -o pid,ppid,psr,%cpu,%mem,vsz,rss,command | grep python | \
awk '{printf "%5s %5s %3s %5s %5s %8.2fGB %8.2fGB %s\n", $1, $2, $3, $4, $5, $6/1048576, $7/1048576, $8}'
```
To ensure the full py command prints, use     
```
ps -u $USER -o pid,ppid,psr,%cpu,%mem,vsz,rss,command | grep python | \
awk '{ 
  printf "%5s %5s %3s %5s %5s %8.2fGB %8.2fGB ", $1, $2, $3, $4, $5, $6/1048576, $7/1048576; 
  for(i=8;i<=NF;++i) printf "%s ", $i; 
  printf "\n"
}'

```