# Specify SSH details on local
In the ```~/.ssh/config``` file (if it doesnot exist, create it) add the following
```
Host amarel.rutgers
  HostName amarel.rutgers.edu
  User unme001
```
<br>

---    
# File Transfer  
> Look for ways to speed-up (parallelize) creation of `compressed archives` in `BASIC_sh.md` under _File Compression and Parallelism_

## (**NEW**) Fast transfer of `*tgz` (Amarel to home directory).    
  1. `rsync` is a powerful tool for file transfers, especially for synchronizing files and directories between two locations. Using `rsync` with `compression` and `SSH` can speed up the transfer.  
  
      ```
      rsync -avzP --progress /path/to/source user@remote_host:/path/to/destination 
      ````  

  1. `scp`  
      ```
      scp -C /path/to/source user@remote_host:/path/to/destination
      ```
  
  1. `bbcp` is designed for high-performance file transfers over high-speed networks. It can split the transfer into multiple streams.     
      ```
      bbcp -s 16 /path/to/source user@remote_host:/path/to/destination  
      ```
      
  
## `scp` Transfer (specific to AMAREL)
### Transfer files from your local system to your Amarel /home directory
```
scp file_1.txt file_2.txt unme001@amarel.rutgers.edu:/home/unme001
```

### Downloadfile from Amarel /home to your local
```
scp unme001@amarel.rutgers.edu:/home/unme001/file_1.txt .
```

### Copy full directory scp: Package directory as a single, compressed file before moving it
```
tar -czf my_dir.tar.gz my_dir
```


<br><br>

# Load python 
```
module use /projects/community/modulefiles
module load anaconda
```