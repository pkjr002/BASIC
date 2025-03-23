# Link your local `GIT`  to    `GitHub`

<br>

### Steps `1 to 4` describe linking your `GitHUB` (online) to your local `git`. 

<br>


## 1: Install and configure `git`

###  Check if `git` is installed 
```
git --version
```
If you get an output e.g. `git version X.X.X.X` skip to **[2]()**  
<br>

- Do this **ONLY** if you need to install git
```
sudo apt install git-all
```

<br><br>
## 2: Configure `git` <u>user.name</u> & <u>*email*</u>

To check the `git` user.name and email associated with the current session
```
git config --list 
```  
If the above **does not** show an output, then you need to set the `--global`  git  `user.name` and `email`. Use commands below. 
```
git config --global user.email "ename@gmail.com"
git config --global user.name "ename"
```  
- **NOTE** that it will be beneficial to have your own email, so if you switch uni you will still have access to GitHub  


## 3: Connect `git` to `GitHub`
> :bulb: `Ctrl+C`  cancel the current command in the terminal.  

<br>

### 3.1: Generate a SSH key pair using the Ed25519 algorithm
*Before entering command below, read the following lines on expected output.* 
```
ssh-keygen -t ed25519 -C ename@gmail.com
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
ssh-agent -s
```  
Before running the command **below** check your shell using `echo $SHELL`.   
Depending on your output use <u>**one**</u> of the below:  
```
eval $(ssh-agent -s)        # if in the bash/sh
eval `ssh-agent -c`         # if in the tcsh
eval "$(ssh-agent -s)"      # if in the zsh
```

<br>

### 3.3: Check if the SSH agent is running.
```
echo $SSH_AUTH_SOCK
```
Output should be of the sort  `/tmp/ssh-rfS3xzyTnhAa/agent.1769`  
*Location will be different for you*

```
echo $SSH_AGENT_PID
```
Output should be an integer (e.g. 1234)

<br>

### 3.4: Add the SSH key to the SSH agent
```
ssh-add ~/.ssh/id_testKEY
```  



 
### 3.5: OPTIONAL     
By making additions to the config file located at `~/.ssh/config`, the explicit use of `ssh-add ~/.ssh/id_testKEY` becomes unnecessary for daily operations, provided you connect to GitHub at least once after starting the agent. If your SSH agent is running, the client automatically adds the `~/.ssh/id_testKEY` to the agent is the additions to the config file are made.This setup offers a more streamlined and secure workflow, especially if you're using passphrase-protected SSH keys.

<br>

First check if `config` file exists use `ls ~/.ssh/config`  
- If there is no terminal output, `config` file <u>does not</u> exists and we need to create one.   
Use `touch ~/.ssh/config`  

<br>

Copy/Paste the following to the `~/.ssh/config` file. 
```
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_testKEY
```

If you are using VScode, you can open the config file by `code ~/.ssh/config`. *For this to work, your path variable should be configured.*
Additionally, you can also use `vi` editor. Here is a list of [vi commands](https://www.cs.colostate.edu/helpdocs/vi.html).  s  

<br>

## 4: Add the public key to the GitHub
In `Settings` option on GitHub.com open [SSH and GPG keys.](https://github.com/settings/keys)  
Add the public key here.   

The public key can be found by
```
cat ~/.ssh/id_testKEY.pub
```

Copy and paete the terminal output of the above to the GitHub [SSH and GPG keys.](https://github.com/settings/keys)  

> :bulb: GitHub also provides a detailed guide for [Adding public key to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) 

This should link local to remote GitHub


## Additionally if you are setting this up on HPC
... make sure to add a file `start-agent.sh` to invoke the `ssh` agent
```
touch ~/.start-agent.sh
```
###### `.` is included so file is hidden

Then add the following:

```
#!/bin/bash
#exec > /dev/null 2>&1
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_testKEY.pub
```
Before you want to push/pull you will have to run  
```
source ~/.start-agent.sh
```
---

<br><br><br>
