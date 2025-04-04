# `GIT` & `GitHUB` 

<b>Git</b> is a <mark>distributed version control system</mark> that allows developers to track changes to code, collaborate on projects, and manage source code history. 
  - It helps teams work on the same project simultaneously without overwriting each other's work and enables reverting to previous versions if needed.

<br>

<b>GitHub</b> is a <mark>web-based platform built on top of Git</mark> that provides tools for hosting, sharing, and collaborating on Git repositories. 
  - It offers features like pull requests, issue tracking, and CI/CD integrations, making it a hub for open-source projects and team-based software development.

<br>  

<details>

<summary> List of frequently used <code> git</code> commands </summary>    
<br>

`git --version`.......................................git version X.X.X.X          
`git remote -v`.......................................details of push/fetch linked to origin  git@github.com:uname/REPO.git     
`git config --list`...................................git details, configured remote repos etc                   
`git rev-parse --show-toplevel`.......................get top-level dir of Git repo     
<br>

`git reset --soft HEAD~1`.............................One commit back     
`git reset --soft [commit-hash]`......................  Moves to [commit-hash], keeping changes staged. Use for undoing commits without affecting the working directory or index.   
`git reset --mixed #`  .................................Mixed allow you to jump to previous commits keeping the changed files        
<br>

`git branch -m bugfix`................Rename a branch     
`git add -u`..........................Stage Deleted Files          
<br>

`git commit --amend -m`...............Change the commit message, NO staged changes can be present    
`git commit --amend --no-edit`........Forgot to add a file to the commit (DOESNOT edit the message)     

`git remote set-url origin git@github.com:uname/BASIC.git` ........ Updates the existing 'origin' remote to point to your fork     
`git remote add origin git@github.com:uname/BASIC.git`........ Adds a new 'origin' remote pointing to your fork   
</details>   

<br><br>

<b>To link</b> `git` to `gitHub` follow  [BASIC_git2GitHUB](BASIC_cluster/BASIC_git2GitHUB.md)   


<br><br>

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

# Common workflows.

### Clone a branch  
- Fetch All Branches and Checkout One `git clone --branch [branch_name] [remote-url]`

- Fetch Files from Single Branch Only `git clone --branch [branch_name] --single-branch [remote-url]`


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

### Delete a file that was previously tracked and pushed to gitHub   

> :rotating_light: This workflow rewrites history — if anyone else has cloned the repo, they’ll need to re-clone or force reset.   

1. make sure you have `git filter-repo` (modern replacement for `filter-branch`)    
    ```
    brew install git-filter-repo    #macOS 
    OR
    pip install git-filter-repo     #linux
    ```

1. Run command to remove the file     
    This removes all traces of the file from history.
    ```
    git filter-repo --force --path path/to/your/file --invert-paths
    ```
      _Replace `path/to/your/file` with the correct path (relative to repo root)._     

1. If pushed this repo to GitHub, need to force push    
    ```
    git push origin --force --all
    git push origin --force --tags
    ```     

1. Cleanup reflogs
    ```
    rm -rf .git/logs
    git gc --prune=now --aggressive
    ```

<br>




<details>
<summary> A list of more higher-level operations : </summary>

`git checkout [Branch 4m where u copying] -- path/to/your/FOLDER/file`....Copy One or two files/FOLDER from one branch to other.   
<br>

`git checkout <commit_hash> <relative_path_to_file_or_dir>`.......Copy files and folder from commit hash of another branch.    
`git ls-tree -r main --name-only`.................................List all git tracked files under the branch main      
`git ls-files | xargs -n 1 dirname | uniq`........................List all git tracked FOLDERS under the branch main      
`git fetch --prune`...............................................Clean local record (of remote/origin) of stale branches that no longer exist origin.   

</details>

<br>

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;"><br>  

## Emojee     
:construction: for work in progress     
:bug: for bug fixes      
:rotating_light: for performance improvements      
:sparkles: for new implementations      
:tada: for initial commits or big changes       
:recycle: for refactoring code      
:wrench: for tooling changes    
<details>    
<summary> Expand for more </summary>     
:pencil2: for fixing typos     
:memo: for documentation     
:heavy_plus_sign: for adding functionality    
:heavy_minus_sign: for removing functionality    
:white_check_mark: for adding tests     
:lock: for dealing with security issues     
:arrow_up: for upgrading dependencies    
:arrow_down: for downgrading dependencies     
:art: for design changes   
:rocket: for new features     
:lipstick: for updating the UI and style     
:green_heart: for fixing CI build        
:ok_hand: for code review     
:cloud: for cloud related changes   
:bookmark: for version tags   
:pushpin: for pinning dependencies    
:information_source: for adding information    
</details>     

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
