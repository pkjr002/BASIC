### 101 Docker

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

