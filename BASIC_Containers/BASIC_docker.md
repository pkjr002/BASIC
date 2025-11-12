# 101 Docker 

  <br>

## Quick commands for `Linux containers ONLY`
To be run from within the container :bulb: on docker `toolbar` look for **Exec** tab.

1. Check details of the exact process that is running:

  ```  
  pgrep -f python | while read -r pid; do
    [ -r "/proc/$pid/cmdline" ] || continue

    cmd=$(tr '\0' ' ' < "/proc/$pid/cmdline")
    cwd=$(readlink "/proc/$pid/cwd" 2>/dev/null || echo "N/A")
    exe=$(readlink "/proc/$pid/exe" 2>/dev/null || echo "N/A")

    printf 'PID: %s\nCMD: %s\nCWD: %s\nEXE: %s\n%s\n' \
      "$pid" "$cmd" "$cwd" "$exe" "------------------------------------"
  done

```

  Then, to inspect the task, use the `PID`.    
  :bulb: Edit the command below (add your `<YOUR PID>`) in a notepad. The docker **Exec** terminal can be hard to edit in.   

  ```  
  watch -n 5 --color '
    PID=<YOUR PID>
    echo "==== PID $PID ($(date "+%F %T")) ===="
    ps -p $PID -o pid,ppid,etime,stat,pcpu,pmem,cmd
    echo
    { echo "FDs: $(ls -1 /proc/$PID/fd 2>/dev/null | wc -l)"; } || true
    awk "/^(Threads|State|VmRSS|VmHWM|voluntary_ctxt_switches|nonvoluntary_ctxt_switches):/ {print}" /proc/$PID/status 2>/dev/null
    echo
    echo "--- /proc/$PID/io ---"
    cat /proc/$PID/io 2>/dev/null || echo "(no permission)"
    echo "==========================="
  '
  ```
  <br>


### Copy a Docker volume to local storage
  1. Copy volume to the host folder.
  ```
  docker run --rm \
    -v temp_sandbox:/src \
    -v /Users/uname/exports/sessions:/dst \
    alpine sh -c 'cp -a /src/. /dst/'
  ```

  1. Copy volume to the host folder.
  ```
  docker run --rm \
    -v temp_sandbox:/src \
    -v /Users/uname/exports/sessions:/dst \
    alpine sh -c 'mkdir -p /dst && cp -a /src/re.session.* /dst/'
  ```

  <br>





### General Docker Commands

`docker system df` ................ Disk Useage

`docker system df` ................ Disk Useage




`docker system df` ................ Disk Useage

`docker build -t <image_name> .` ................Build an image from a Dockerfile

`docker ps` ................List running containers 

`docker start <container_id>`     
`docker start -ai <container_#>`    
`docker rm <container_id>`    

  <br>


### Set `RAM` and `CPU`.     
To check the details :
```
nproc               # Should show 24
free -h             # See 24 GB memory + 8 GB swap
``` 

If you are running on windows, use the (`C:\Users\UNAME\.wslconfig`). 
```
[wsl2]
memory=24GB
processors=24
swap=8GB
localhostForwarding=true
```


### Free Up Space (🚨 not for noobs, use at own risk)        
🏗️ This part is work in progress.      
> 🚨 I have accidentally deleted containers so PLEASE read and understand before you use.            


* Remove Unused <b>Containers</b>
    ```
    docker container prune -f
    ```

* Remove Unused <b>Images</b>
    ```
    docker image prune -a -f
    ```

* Remove Unused <b>Volumes</b>
    ```
    docker volume prune -f
    ```

* Clear <b>Build Cache</b>
    ```
    docker builder prune -a -f
    ```

* <b>Full Cleanup</b>  
  <span style="color: red; ">If you want to wipe everything unused</span>
    ```
    docker system prune -a --volumes -f
    ```
    <mark>Warning</mark>: This will remove all unused containers, images, volumes, and cache.

