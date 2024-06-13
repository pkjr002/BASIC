# Automation

### Automate a webpage to open at a particular time

##### 1. Make a shell script
Ensure your shell script (`~/__Automation/open_browser.sh`) looks like this, with the appropriate profile and URL:
```
#!/bin/bash
open -na "Google Chrome" --args --profile-directory="Profile 1" "https://example.com"  
```  
> :bulb: Check your chrome profile. Open a new chrome tab and type `chrome://version/`  

##### 2. Make the Script Executable:  
in the terminal add `$ chmod +x ~/__Automation/open_browser.sh`    

##### 3. Schedule the Script Using crontab:
```
$ crontab -e  
```
Add the following in the open file:
```
0 22 * * * ~/__Automation/open_browser.sh
```
> :bulb: `crontab` is a Unix utility that allows users to schedule tasks to run automatically at specified times and intervals. These tasks are defined in a file called a "crontab file". Each line in the crontab file represents a scheduled task, known as a "cron job".
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




