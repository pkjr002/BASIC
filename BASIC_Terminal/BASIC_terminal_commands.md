`whoami`..........................Display the current user name  
`pwd   `..........................Print the working directory  
`ls    `..........................List directory contents  
`cd    `..........................Change directory  
`cp    `..........................Copy files and directories  
`mv    `..........................Move/rename files and directories  
`rm    `..........................Remove files or directories  
`mkdir `..........................Make directories  
`rmdir `..........................Remove empty directories  
`touch `..........................Change file timestamps/if not exist create empty file  
`echo  `..........................Display a line of text  
`cat   `..........................Concatenate files and print on the standard output  
`less  `..........................View file contents interactively  
`grep  `..........................Search text using patterns  
`find  `..........................Search for files in a directory hierarchy  
`df    `..........................Display disk space usage  
`du    `..........................Estimate file space usage  
`chmod `..........................Change file mode bits  
`chown `..........................Change file owner and group  
`top   `..........................Display Linux processes  


`ps       `............................Report a snapshot of the current processes  
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
`awk      `............................Pattern scanning and processing language  
`cron     `............................Daemon to execute scheduled commands  
`crontab  `............................Schedule a command to run at a later time  
`alias    `............................Create an alias for a command  
`history  `............................Display or manipulate the history list  
`env      `............................Display, set, or remove environment variables  
`export   `............................Set or export the environment variable  
`uname    `............................Print system information  
`man      `............................Interface to the system reference manuals  




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
