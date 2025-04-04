# 101 Setup for working on amarel    
## Some useful links:    
1. [Rutgers:Amarel](https://sites.google.com/view/cluster-user-guide) cluster guide.      
1. OARC/AMAREL [updates](https://oarc.rutgers.edu/events/list/) can be found here.  
1. AMAREL hardware [spec](https://sites.google.com/view/cluster-user-guide/amarel#h.kyrykrouyxxz)

<br>

## Connect TO amarel via `SSH` 

```
ssh <NetID>@amarel.rutgers.edu
```
The above will prompt for password. To avoid password prompts: Use SSH keys.    

1. Generate a key pair 
    ```
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ```
    Refer to [git2GitHUB](/BASIC_cluster/BASIC_git2GitHUB.md#31-generate-a-ssh-key-pair-using-the-ed25519-algorithm) and choose key location. 

1. Copy this `.pub` file key to amarel `~/.ssh/authorized_keys`
    ```
    cat ~/.ssh/id_ed25519.pub | ssh unme@amarel.rutgers.edu "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
    ```

1. Test login without password:   
    ```
    ssh unme@amarel.rutgers.edu
    ```

1. Alias the `unme@amarel.rutgers.edu` on local machine.    
  In the `~/.ssh/config` file (if it doesnot exist, create it) add the following:     
    ```
    Host amarel
      HostName amarel.rutgers.edu
      User uname
      IdentityFile ~/.ssh/id_file
      IdentitiesOnly yes
    ```
    Adding this allows you to `ssh amarel` to login without password.     

<br>

## Link git to gitHUB 
Check out this section on [Link your local `GIT`  to    `GitHub`](/BASIC_cluster/BASIC_git2GitHUB.md#link-your-local-git-to-github)

<br>

# File Transfer  
> :bulb: Look for ways to speed-up (parallelize) creation of `compressed archives` in [BASIC_sh.md](/BASIC_sh/BASIC_sh.md#file-compression)

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



<details>
<summary> Script to copy multiple files</summary>
  Make sure you have <a href="/BASIC_cluster/BASIC_amarel_rutgers.md#connect-to-amarel-via-ssh"> SSH configured </a>
  
  ```
  #!/bin/bash

  # variable format 
  REMOTE_USER="uname"
  REMOTE_HOST="amarel.rutgers.edu" 
  REMOTE_PATH="/scratch/$(REMOTE_USER)/FACTS"

  FILES=(
    facts.install.amarel_incomplete.md
    facts.install.exec.facts.md
    READMEpostprocess.md
    facts.install.nz.exp.cookbook.md
    FACTS.2024.08.02_spaceTree.txt
  )

  for FILE in "${FILES[@]}"; do
      scp "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/${FILE}" .
      
      # OR If you have added  alias in `~/.ssh/config` then use 
      scp amarel:${REMOTE_PATH}/${FILE}" .

  done
  ```
</details>





<br>

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
