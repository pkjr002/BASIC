# 101 Docker 
  :construction: This is work in progress :construction:
  <br>


### General Docker Commands

1. <details>
   <summary>Engine</summary>

   ```
   sudo systemctl start docker
   sudo systemctl stop docker
   sudo systemctl restart docker
   sudo systemctl status docker
   sudo systemctl enable docker
   sudo systemctl enable containerd
   ```

1. <details>
   <summary>Terminal commands that replace the dashboard</summary>
   To be run from within the container :bulb: on docker `toolbar` look for **Exec** tab.
   
   OR launch exec in terminal
   
   ```
   docker exec -it <container> /bin/bash
   ```
   
   ```
   docker ps              # running containers
   docker ps -a           # all containers
   docker image ls        # images
   docker volume ls       # volumes
   docker network ls      # networks
   
   docker stats           # live CPU/RAM usage
   docker logs -f NAME    # follow logs
   docker inspect NAME    # full details
   docker exec -it NAME bash
   
   docker compose up -d
   docker compose ps
   docker compose logs -f
   docker compose down

   docker system df.      # Disk Useage
   ```
   </details>

1. <details>
   <summary>Verify Docker is working</summary>

   ```
   sudo systemctl status docker
   sudo docker run hello-world
   docker version
   docker compose version
   ```
   </details>

1. <details>
   <summary>Delete Containers \& Images</summary>

   ```
   # containers
   docker ps -a      
   docker rm -f mycontainer
  
   # Images
   docker image ls
   docker rmi myimage:latest
   ```
   </details>

1. <details>
   <summary>Inspect</summary>

   ``` 
   docker ps                    # see containers
   docker top mycontainer       # see processes inside container
   docker exec -it mycontainer /bin/bash
   ```
   </details>

1. <details>
   <summary>Inspect exact process that is running:</summary>
   
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

