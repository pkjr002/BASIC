# Automation

### Automate a webpage using `corn`, to open at a particular time.  

`cron` is a background scheduler daemon on Unix-like systems (Linux, macOS).   
  * It runs in the background as a daemon (crond) and executes commands or scripts at scheduled times.
  * It runs continuously and executes jobs (commands/scripts) at scheduled times.   
  * Jobs are defined in a crontab (cron table).    
  * Each user has their own crontab file.    
    - There’s also a system-wide crontab (in `/etc/crontab`) and sometimes directories like `/etc/cron.daily/`, `/etc/cron.hourly/`, etc.    
    - You don’t edit the file directly — you use commands like `crontab -e` to edit, `crontab -l` to list.    

<br>

:gear: `Managing Cron Jobs`     
  * crontab -l → list current jobs for your user
  * crontab -e → edit your crontab (opens in default editor, usually vi or nano)
  * crontab -r → remove all cron jobs for your user (⚠ dangerous)
  * crontab -u <user> → manage jobs for another user (requires sudo)

<hr style="position: absolute; left: 1.5; width: 100%; height: 2px; background-color: blue; border-style: dotted;">  <br>

<br><br>

##### 1. Create a shell script. 
Ensure your shell script (`~/Automation/open_browser.sh`) looks like this, with the appropriate profile and URL:
```
#!/bin/bash
open -na "Google Chrome" --args --profile-directory="Profile 1" "https://example.com"  
```  

:bulb: To Check your chrome profile, open a new chrome tab and type `chrome://version/`  

<br>


##### 2. Make the Script Executable:  
in the terminal type `$ chmod +x ~/Automation/open_browser.sh`    

<br>


##### 3. Schedule the Script Using crontab:
To schedule the corntab, type:  
```
$ crontab -e  
```
Add the following in the open file:
```
0 22 * * * ~/Automation/open_browser.sh
```
:bulb: `crontab` is a Unix utility that allows users to schedule tasks to run automatically at specified times and intervals. These tasks are defined in a file called a "crontab file". Each line in the crontab file represents a scheduled task, known as a "cron job".

```
* * * * * command to be executed
- - - - -
| | | | |
| | | | +---- Day of the week (0 - 7) (Sunday is both 0 and 7)
| | | +------ Month (1 - 12)
| | +-------- Day of the month (1 - 31)
| +---------- Hour (0 - 23)
+------------ Minute (0 - 59)
```  

Example  
```
*/5 * * * *   echo "Runs every 5 minutes"
0 */2 * * *   echo "Runs every 2 hours"
0 0 1 * *     echo "Runs on the 1st of every month"
0 9-17 * * 1-5 echo "Runs every hour 9AM–5PM Mon–Fri"
```



<hr style="position: absolute; left: 1.5; width: 100%; height: 2px; background-color: blue; border-style: dotted;">  <br>  

<br><br>

:pushpin: `Cron` is used whenever something needs to be done automatically on a repeating schedule. Common use-cases:
  - System maintenance (Clean up temp files weekly, Reboot servers on schedule)
  - Backups (Run database dumps, Archive files into `.tar.gz`, Sync to cloud storage)
  - Automation of scripts (Run a Python script daily to fetch data, Scrape a website regularly)
  - Monitoring and alerts

<br>