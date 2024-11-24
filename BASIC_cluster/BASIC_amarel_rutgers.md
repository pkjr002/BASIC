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

<br><br>

# Sync /scratch to a Cloud Storage    
The following has not been tested, donot use.

1. Set up `rclone` on amarel 
    * Use this [link](http://moo.nac.uci.edu/~hjm/HOWTO-rclone-to-Gdrive.html#_rclone_configuration)   
      
      ```
      rclone config
      ````  
      
        
    * Create a new remote
    * Give it a name you will remember (e.g., gd_amarel)
    * Select “Google Drive” (option 18)
    * Leave blank the following 2 questions (client_id and client_secret)
    * Scope: Full access all files (option 1)
    * Leave blank the following 2 questions (root_folder_id and root_folder_id)
    * Edit advanced config: No
    * Use web browser to automatically authenticate rclone with remote?: No
    * You should install rclone on your local machine (see rclone script install) and run the command that is printed to the screen
    * Your local browser should open and ask you to log in using your R Google account
    * Copy the code that is returned on your local machine (long string) and past it on server
    * Configure this as a Shared Drive: No

      ```
      rclone -v --transfers=32 --checkers=16 --skip-links --drive-chunk-size=16384k --drive-upload-cutoff=16384k sync /scratch/gd-uname gdrive_uname:gd-uname
      ```

1. Automate the Backup using `cronjob`   
    * Create a `cronfile` and put the following lines:   
      ```
      SHELL=/bin/bash

      MAILTO=

      #update PATH
      PATH=/usr/local/bin:/bin:/usr/bin:~/bin

      #cronjob
      00 16 * * 0 rclone -v --transfers=32 --checkers=16 --skip-links --drive-upload-cutoff=16384k  copy /scratch/gd-uname gdrive_uname:gd-uname
      ```

      <details>
      <summary>Above referenced from </summary>    

        [Mathieu Morlighem](https://icefuture.org/team/guide-for-new-team-members/)    
      </details>  
