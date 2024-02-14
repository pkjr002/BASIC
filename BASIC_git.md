# Basic Install

## Check if git is installed 
```$ git --version```

Install by 
```$ sudo apt install git-all```

## Check for git user name and the email 
```$ git config --list --show-origin```  
* if the above does not show an o/p, you need to set the --global git name and email.  
```
$ git config --global user.email "ename@gmail.com"
$ git config --global user.name "ename"
```  
* NOTE that its will be beneficial to have your own email, so if you witch companies you will still have access to git/gitHUB

## Pull/push to
```$ git remote -v```

## STEP 3
Setting up the SSH keys
```$ ssh-keygen -t ed25519 -C ename@gmail.com```  
```
NOTE: location/name/passwd option
Enter file in which to save the key (/home/ename/.ssh/id_ed25519): /home/ename/.ssh/id_wahab      
Enter passphrase (empty for no passphrase):
```

## STEP 4: Run the SSH agent 
think of it as like a digital wallet that holds your keys  
```$ ssh-agent -s```  
* check the shell ```$ echo$SHELL```  
If in the tcsh, then use ```$ eval `ssh-agent -c` ```  
If in the zsh, then use ```$ eval "$(ssh-agent -s)".```  

#### To check the agent
```
$ echo $SSH_AUTH_SOCK
$ echo $SSH_AGENT_PID
```

## STEP 5: Link the the key to the agent
Check if the config file exists  
```$ ls ~/.ssh/config```
*** if no file exists, we need to create one.   
```$ touch ~/.ssh/config```  
Check if the file is created ```$ ls ~/.ssh/config```

## STEP 6: Add private key to the SSH agent
Next add the keys to the config file.   
```$ vim ~/.ssh/config```  

Add the following
```
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_wahab
```

## STEP 7: Add the key to the SSH agent
```$ ssh-add ~/.ssh/id_wahab```

## STEP 8: Add the public key to the gitHUB
Go to setting on gitHUB --> SSH and GPG keys
Add the public key here 

The public key can be found by
```$ cat ~/.ssh/id_wahab.pub```

This should link cluster git to gitHUB
-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
# Danger
```
$ git filter-branch --index-filter \
    'git rm --cached --ignore-unmatch path/to/mylarge_50mb_file' \
    --tag-name-filter cat -- --all
```

# WARNING Clean the dir of untracked. (Removes all files from the folder that are not tracked)
```
git clean -xdf
-x removes ignored files, -d removes untracked folders, -f removes untracked files.
```






# Copy Particular folder and its files in branch A to be moved to branch B
-> Go to the desired branch, in this case branchB. 
Then type, git checkout BranchA 
git mv <old-folder-name> <new-folder-name>
git add <new-folder-name>
git commit -m "Move and rename folder from Branch A to Branch B"
git rm -r <path-to-folder>    # Use -r if it's a folder
git commit -m "Remove original folder from Branch A"

# Reset main to origin-main
git fetch origin
git reset --hard origin/main

# mixed allow you to jump to previous commits.  (keeps the changed files)
git reset --mixed #

# One commit back
git reset --soft HEAD~1

# Merge main into a branch
$ git checkout main
$ git pull
$ git checkout $BRANCH
$ git merge main
$ git push

# Push your changes to gitHUB (to origin )
$ git push origin main

# Push new Branch to remote.
$ git push -u origin <branch> 

# Stage Deleted Files
$ git add -u

# change the commit message (NO staged changes can be present)
$ git commit --amend -m "

# Forgot to add a file to the commit (DOESNOT edit the message)
$ git commit --amend --no-edit

#Copy One or two files from one branch to other.
git checkout [Branch 4m where u copying] -- path/to/your/file.

#Copy folder from one branch to other.
git checkout [Branch 4m where u copying] -- path/to/your/folder

#Copy files and folder from commit hash of another branch.
git checkout <commit_hash> <relative_path_to_file_or_dir>


# To list all the files currently git show tracked files being tracked under the branch master using:
$ git ls-tree -r master --name-only 
$ git ls-files | xargs -n 1 dirname | uniq

# To clean local record (of remote/origin) of stale branches that no longer exist on origin.
git fetch --prune

# Rename a branch
git branch -m bugfix

# ==============================
Keep up with main on local.
$ git fetch origin
$ git reset --hard origin/main

# ==============================
# Save your branch
$ git commit -a -m "Saving my work, just in case"
$ git branch $BRANCH_NAME

# ==============================
:bug: for bug fixes
:memo: for documentation
:art: for design changes
:rocket: for new features
:sparkles: for new implementations
:recycle: for refactoring code
:white_check_mark: for adding tests
:lock: for dealing with security issues
:heavy_plus_sign: for adding functionality
:heavy_minus_sign: for removing functionality
:wrench: for tooling changes
:pencil2: for fixing typos
:lipstick: for updating the UI and style
:green_heart: for fixing CI build

:tada: for initial commits or big changes
:sparkles: for new implementations
:recycle: for refactoring code
:white_check_mark: for adding tests
:lock: for dealing with security issues
:heavy_plus_sign: for adding functionality
:heavy_minus_sign: for removing functionality
:wrench: for tooling changes
:pencil2: for fixing typos
:lipstick: for updating the UI and style
:green_heart: for fixing CI build
:rotating_light: for performance improvements
:ok_hand: for code review
:cloud: for cloud related changes
:arrow_up: for upgrading dependencies
:arrow_down: for downgrading dependencies
:bookmark: for version tags
:pushpin: for pinning dependencies
:construction: for work in progress
:information_source: for adding information




# WARNING Clean the dir of untracked. (Removes all files from the folder that are not tracked)
```
git clean -xdf
-x removes ignored files, -d removes untracked folders, -f removes untracked files.
```

# Danger
```
$ git filter-branch --index-filter \
    'git rm --cached --ignore-unmatch path/to/mylarge_50mb_file' \
    --tag-name-filter cat -- --all
```