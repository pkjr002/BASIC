# Linux Terminal 101  

`whoami`..........................Display the current user name  

`pwd   `..........................Print the working directory  
`ls    `..........................List directory contents, `-l` for details.   
`cd    `..........................Change directory  
`cp    `..........................Copy files and directories  
`mv    `..........................Move/rename files and directories  
`rm    `..........................Remove directories  use `-r` for recursively
`mkdir `..........................Make directories  
`touch `..........................Change file timestamps/if not exist create empty file  

<br>   

`echo  `..........................Display (print) a line of text  
`cat   `..........................Concatenate files and print on the standard output  
`less  `..........................View file contents interactively  
`grep  `..........................Search text using patterns  
`find  `..........................Search for files in a directory hierarchy  
`awk      `............................Pattern scanning and processing language  

<br>

`df    `..........................Display disk space usage  
`du    `..........................Estimate file space usage  

#### Utils
`top   `..........................Display Linux processes    
    *flags* ==>
    `-h`: Display the help screen,`-q`: Quit top,`-k`: Kill a task (you will be prompted for the PID),`-r`: Renice a task (you will be prompted for the PID and the renice value),  
    `-u`: Show tasks for a specific user (you will be prompted for the username),`-M`: Sort tasks by memory usage,`-P`: Sort tasks by CPU usage,`-T`: Sort tasks by the time they have been running,  
    `-i`: Toggle the display of idle tasks,`-d`: Change the delay between screen updates (you will be prompted for the delay time in seconds),`-s`: Toggle the summary information on and off,  
    `-f`: Enter the field management screen to add or remove columns,`-x`: Highlight the sort column,`-y`: Highlight running tasks,`-z`: Toggle color/mono mode,`-b`: Toggle bold for running tasks.  


`ps       `............................Report a snapshot of the current processes  
`ps aux`, `ps -ef` snapshot of current processes  


`last` listing of last logged in users.
`who`  Shows who is currently logged in.
`w`    Shows who is logged on and what they are doing.  



`kill     `............................Send a signal to a process  
`tar      `............................Archive utility  
`gzip     `............................Compress or expand files  
`unzip    `............................Extract compressed files in a ZIP archive  
`ssh      `............................OpenSSH SSH client (remote login program)  
`scp      `............................Secure copy (remote file copy program)  

`wget     `............................The non-interactive network downloader  
`curl     `............................Transfer data from or to a server  
`diff     `............................Compare files line by line  
`sed      `............................Stream editor for filtering and transforming text  

`history  `............................Display or manipulate the history list  
`env      `............................Display, set, or remove environment variables  
`export   `............................Set or export the environment variable  
`man      `............................Interface to the system reference manuals  


uptime system uptime
iostat reports CPU statistics and input/output statistics for devices and partitions.    
lastlog reports the most recent login of all users or `-u <unme>` of a specified user.  
id prints user and group information for the specified user `<username>`
groups

## System  
`uname -a`: Basic information about the system, such as the kernel name, version, and architecture. 
- Alternate `uname -a | awk '{print $0}'`. Cycle through ~num~ to get desired field.   
*fields listed* 
1. Kernel name, 2. Hostname, 3. Kernel release, 4. Kernel version and build info, 5. Build date and time, 6. Hardware architecture, 7. Processor type, 8. Hardware platform, 9. Operating system name
`uname -r`: Shows the kernel version.
`uname -o`: Displays the operating system.


## Network    
`ifconfig`, `ip addr show`  Check IP Address   
`ifconfig -a`, `ip link show` Check Network Interfaces    
`netstat -rn`, `ip route` Check Routing Table      
`netstat -atn` Check Active Connections    
`route -n` , `ip route show`  Check Default Gateway    


## On linux     
```    
cat /etc/os-release: Displays operating system identification data.
cat /etc/issue: Shows a system identification file with a short description of the OS.
cat /proc/version: Provides version information about the Linux kernel.
```    

## Users 
`last` listing of last logged in users   
`who` who is currently logged in  
`w` who is logged on and what they are doing  
`id <usrnme>`  
uptime

<br>

# `Top`  
Get `PID` of the process.   
```
ps aux | grep process_name  
```     

This displays information about the process with the PID 1234. `ps -p 1234`  

Then you can use `top -pid 33601`



```
ps -eo pid,ppid,cmd,%mem,%cpu

ps -ef | grep
```


ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | grep python

ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu > ps_snapshot4.txt

sstat -j <JOBID>.batch -o "JobID,MaxRSS,AveCPU,MaxDiskRead,MaxDiskWrite"
scontrol show job <JOBID>



## Docker
nproc
cat /proc/cpuinfo | grep processor | wc -l


## Automate
`cron     `............................Daemon to execute scheduled commands  
`crontab  `............................Schedule a command to run at a later time  
