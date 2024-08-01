# `GIT`
<br>  

> **frequently used** 

`git --version`.......................................git version X.X.X.X        
`git remote -v`.......................................details of push/fetch linked to origin  git@github.com:uname/REPO.git
`git config --list`...................................git details, configured remote repos etc               
`git rev-parse --show-toplevel`.......................get top-level dir of Git repo

<br>

`git reset --soft HEAD~1`.............................One commit back
`git reset --soft [commit-hash]`......................
`git reset --mixed #`  .................................Mixed allow you to jump to previous commits keeping the changed files
       
<br>

`git branch -m bugfix`................Rename a branch
`git add -u`..........................Stage Deleted Files    
`git commit --amend -m`...............Change the commit message, NO staged changes can be present    
`git commit --amend --no-edit`........Forgot to add a file to the commit (DOESNOT edit the message)     


<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

Common workflows.

### Push your changes to GitHub (to origin )
```
$ git push origin main
$ git push -u origin <branch>
```

### Save your branch
```
$ git commit -a -m "Saving my work, just in case"
$ git branch $BRANCH_NAME
```


### Merge main into a branch
```
$ git checkout main
$ git pull
$ git checkout $BRANCH
$ git merge main
$ git push
```


### Reset local/main to origin/main   
To maintain Source of truth in the event you are working off a fork/cloned repo and want to keep up with ORIGIN/main on local/main.    
```
git fetch origin
git reset --hard origin/main
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

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

Advanced

`git checkout [Branch 4m where u copying] -- path/to/your/FOLDER/file`....Copy One or two files/FOLDER from one branch to other.   

<br>

`git checkout <commit_hash> <relative_path_to_file_or_dir>`.......Copy files and folder from commit hash of another branch.    
`git ls-tree -r main --name-only`.................................List all git tracked files under the branch main      
`git ls-files | xargs -n 1 dirname | uniq`........................List all git tracked FOLDERS under the branch main      
`git fetch --prune`...............................................Clean local record (of remote/origin) of stale branches that no longer exist origin.   

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;"><br>  

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


<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;"> <br> 

# `.gitignore`
Ignore directories named `_DIR` at any depth
```
**/_DIR/
```

#### A collection of [`.gitignore` templates](https://github.com/github/gitignore)

### Sample `.gitignore`  
```
# Byte-compiled #
__pycache__/
*.py[cod]
*$py.class
.DS_Store 

# format files #

# User folders #

# User files #
print_.py
```

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">    <br>

#### Identifying the Protocol from the URL
HTTPS URL
```
origin  https://github.com/username/repository.git (fetch)
origin  https://github.com/username/repository.git (push)
```
SSH URL
```
origin  git@github.com:username/repository.git (fetch)
origin  git@github.com:username/repository.git (push)
```

####  Switching Between HTTPS and SSH
To switch to HTTPS 
```
git remote set-url origin https://github.com/username/repository.git
```  
To switch to SSH 
```
git remote set-url origin git@github.com:username/repository.git
```  



<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: red; border-style: dotted;">  <br>

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
<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: red; border-style: dotted;">  <br>
