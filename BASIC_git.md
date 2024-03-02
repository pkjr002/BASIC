# `GIT`    *&*    `GitHub`

> **Author:** pkjr002@gmail.com    
> **Date:** 2024-02-16   
> **Needs:** VS code

<br>

### Note:: `1 to 4` describe linking your `GitHUB` (online) to your local `git`. 

<br>


## 1: Install and configure `git`

###  Check if `git` is installed 
```
$ git --version
```
If you get an output e.g. `git version X.X.X.X` skip to **[2]()**  
<br>

- Do this **ONLY** if you need to install git
```
$ sudo apt install git-all
```

<br><br>
## 2: Configure `git` <u>user.name</u> & <u>*email*</u>

To check the `git` user.name and email associated with the current session
```
$ git config --list 
```  
If the above **does not** show an output, then you need to set the `--global`  git  `user.name` and `email`. Use commands below. 
```
$ git config --global user.email "ename@gmail.com"
$ git config --global user.name "ename"
```  
- **NOTE** that it will be beneficial to have your own email, so if you switch uni you will still have access to GitHub  


## 3: Connect `git` to `GitHub`
> :bulb: `Ctrl+C`  cancel the current command in the terminal.  

<br>

### 3.1: Generate a SSH key pair using the Ed25519 algorithm
*Before entering command below, read the following lines on expected output.* 
```
$ ssh-keygen -t ed25519 -C ename@gmail.com
```

When you generate the `SSH key pair` by run the command above, **note** that the output will be like:  

>> Generating public/private ed25519 key pair.  
>> Enter file in which to save the key (/Users/uname/.ssh/id_ed25519): /Users/<uname>/.ssh/id_testKEY  
>> Enter passphrase (empty for no passphrase):  <skip for tutorial>   
>> Enter passphrase (empty for no passphrase):  <skip for tutorial>   

After hitting `Enter` key twice the output <u>**should**</u> look like 

>> Your identification has been saved in /Users/<uname>/.ssh/id_testKEY  
>> Your public key has been saved in /Users/<uname>/.ssh/id_testKEY.pub  
>> The key fingerprint is:  
>> SHA256:xxxxxxxxx ename@gmail.com  
>> The key's randomart image is:  
>> *There will be a cool Image key generated here*

Remember that all this is being stored in `/Users/<uname>/.ssh/` if you need to access/delete generated keys.



<br>

### 3.2: Invoke the SSH agent  
```
$ ssh-agent -s
```  
Before running the command **below** check your shell using `$ echo $SHELL`.   
Depending on your output use <u>**one**</u> of the below:  
```
$ eval $(ssh-agent -s)        # if in the bash/sh
$ eval `ssh-agent -c`         # if in the tcsh
$ eval "$(ssh-agent -s)"      # if in the zsh
```

<br>

### 3.3: Check if the SSH agent is running.
```
$ echo $SSH_AUTH_SOCK
```
Output should be of the sort  `/tmp/ssh-rfS3xzyTnhAa/agent.1769`  
*Location will be different for you*

```
$ echo $SSH_AGENT_PID
```
Output should be an integer (e.g. 1234)

<br>

### 3.4: Add the SSH key to the SSH agent
```
$ ssh-add ~/.ssh/id_testKEY
```  



 
### 3.5: OPTIONAL     
By making additions to the config file located at `~/.ssh/config`, the explicit use of `$ ssh-add ~/.ssh/id_testKEY` becomes unnecessary for daily operations, provided you connect to GitHub at least once after starting the agent. If your SSH agent is running, the client automatically adds the `~/.ssh/id_testKEY` to the agent is the additions to the config file are made.This setup offers a more streamlined and secure workflow, especially if you're using passphrase-protected SSH keys.

<br>

First check if `config` file exists use `$ ls ~/.ssh/config`  
- If there is no terminal output, `config` file <u>does not</u> exists and we need to create one.   
Use `$ touch ~/.ssh/config`  

<br>

Copy/Paste the following to the `~/.ssh/config` file. 
```
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_testKEY
```

If you are using VScode, you can open the config file by `$ code ~/.ssh/config`. *For this to work, your path variable should be configured.*
Additionally, you can also use `vi` editor. Here is a list of [vi commands](https://www.cs.colostate.edu/helpdocs/vi.html).  s  

<br>

## 4: Add the public key to the GitHub
In `Settings` option on GitHub.com open [SSH and GPG keys.](https://github.com/settings/keys)  
Add the public key here.   

The public key can be found by
```
$ cat ~/.ssh/id_testKEY.pub
```

Copy and paete the terminal output of the above to the GitHub [SSH and GPG keys.](https://github.com/settings/keys)  

> :bulb: GitHub also provides a detailed guide for [Adding public key to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) 

This should link local to remote GitHub

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

### Push your changes to GitHub (to origin )
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