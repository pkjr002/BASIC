### 101 Docker

**To be run from within the container**
```  
for pid in $(pgrep -f python); do
  echo "PID: $pid"
  echo "CMD: $(cat /proc/$pid/cmdline | tr '\0' ' ')"
  echo "CWD: $(readlink /proc/$pid/cwd)"
  echo "EXE: $(readlink /proc/$pid/exe)"
  echo "------------------------------------"
done

```

```  
watch -n 5 'echo "==== PID 17479 Status ===="; ps -p 17479 -o pid,etime,pcpu,pmem,stat,cmd; echo; cat /proc/17479/io; echo "==========================="'

```



`docker system df` ................ Disk Useage

`docker system df` ................ Disk Useage




`docker system df` ................ Disk Useage

`docker build -t <image_name> .` ................Build an image from a Dockerfile

`docker ps` ................List running containers 

`docker start <container_id>`     
`docker start -ai <container_#>`    
`docker rm <container_id>`    

### Free Up Space

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

