# `GIT`: Install | `gitHUB`: Commands
<br>  

> **Author:** praveen.kumar@rutgers.edu  
> **Date:** 2024-02-16   
> **Needs:** VS code

<br>

## 1) Check if `git` is installed 
```
$ git --version
```
If you get an output e.g. `git version X.X.X.X` skip to **[2]()**  
<br>

- **ONLY** if you need to install git
```
$ sudo apt install git-all
```

<br><br>
## 2: Configure `git` <u>user.name</u> & <u>*email*</u>

To check `git` user.name and email associated with the current session
```
$ git config --list 
```  
If the above does not show an output, then you need to set the `--global`  git  `user.name` and `email`.  
```
$ git config --global user.email "ename@gmail.com"
$ git config --global user.name "ename"
```  
- **NOTE** that it will be beneficial to have your own email, so if you switch uni you will still have access to gitHUB  


## 3: Connect `git` to `gitHUB`
> :bulb: `Ctrl+C`  cancel the current command in the terminal.  

### 3.1: Generate a SSH key pair using the Ed25519 algorithm
```
$ ssh-keygen -t ed25519 -C ename@gmail.com
```

When you generate the `SSH key pair` by run the command above, **note** that the output will be like:  

>> Generating public/private ed25519 key pair.  
>> Enter file in which to save the key (/Users/uname/.ssh/id_ed25519): /Users/<uname>/.ssh/id_SOMEname  
>> Enter passphrase (empty for no passphrase):  <skip for tutorial>   
>> Enter passphrase (empty for no passphrase):  <skip for tutorial>   


### 3.2: Run the SSH agent 
*Think of it as like a digital wallet that holds your keys*  
```
$ ssh-agent -s
```  
Before running the command below check your shell using `$ echo$SHELL`. Depending on your output use <u>**one**</u> of the below:  
```
$ eval $(ssh-agent -s)        # if in the bash/sh
$ eval `ssh-agent -c`         # if in the tcsh
$ eval "$(ssh-agent -s)"      # if in the zsh
```
(EDIT from here)


#### To check the agent
```
$ echo $SSH_AUTH_SOCK
$ echo $SSH_AGENT_PID
```

## STEP 5: Link the the key to the agent
Check if the config file exists  
```
$ ls ~/.ssh/config
```
If no file exists, we need to create one (`$ touch ~/.ssh/config`)  
Check if the file is created (`$ ls ~/.ssh/config`)

## STEP 6: Add the private key to the config file
Open the config file
```
$ code ~/.ssh/config
```  

And add the following
```
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_wahab
```

## STEP 7: Add the key to the SSH agent
```
$ ssh-add ~/.ssh/id_wahab
```

## STEP 8: Add the public key to the gitHUB
Go to setting on gitHUB --> SSH and GPG keys
Add the public key here 

The public key can be found by
```
$ cat ~/.ssh/id_wahab.pub
```
### **This should link cluster git to gitHUB**

---

<br><br><br>

# Git_101
<br>

## Danger
```
$ git filter-branch --index-filter \
    'git rm --cached --ignore-unmatch path/to/mylarge_50mb_file' \
    --tag-name-filter cat -- --all
```
## WARNING Clean the dir of untracked. (Removes all files from the folder that are not tracked)
```
git clean -xdf
-x removes ignored files, -d removes untracked folders, -f removes untracked files.
```

### Copy Particular folder and its files in branch A to be moved to branch B
```
-> Go to the desired branch, in this case branchB. 
Then type, git checkout BranchA 
git mv <old-folder-name> <new-folder-name>
git add <new-folder-name>
git commit -m "Move and rename folder from Branch A to Branch B"
git rm -r <path-to-folder>    # Use -r if it's a folder
git commit -m "Remove original folder from Branch A"
```

#### Pull/push to
```
$ git remote -v
```

### Reset main to origin-main (Keep up with ORIGIN/main on local/main)
```
git fetch origin
git reset --hard origin/main
```
### Mixed allow you to jump to previous commits.  (keeps the changed files)
```
git reset --mixed #
```
### One commit back
```
git reset --soft HEAD~1
```
### Merge main into a branch
```
$ git checkout main
$ git pull
$ git checkout $BRANCH
$ git merge main
$ git push
```

### Push your changes to gitHUB (to origin )
```
$ git push origin main
$ git push -u origin <branch>
```

### Stage Deleted Files
```
$ git add -u
```

### change the commit message (NO staged changes can be present)
```
$ git commit --amend -m "
```

### Forgot to add a file to the commit (DOESNOT edit the message)
```
$ git commit --amend --no-edit  
```

### Copy One or two files from one branch to other.
```
git checkout [Branch 4m where u copying] -- path/to/your/file.
```
### Copy folder from one branch to other.
```
git checkout [Branch 4m where u copying] -- path/to/your/folder
```

### Copy files and folder from commit hash of another branch.
```
git checkout <commit_hash> <relative_path_to_file_or_dir>
```

### To list all the files currently git show tracked files being tracked under the branch master using:
```
$ git ls-tree -r master --name-only 
$ git ls-files | xargs -n 1 dirname | uniq
```

### To clean local record (of remote/origin) of stale branches that no longer exist on origin.
```
git fetch --prune
```

### Rename a branch
```
git branch -m bugfix
```

### Save your branch
```
$ git commit -a -m "Saving my work, just in case"
$ git branch $BRANCH_NAME
```

---  
## Emojee  
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