# Docker Commands Cheat Sheet

---

## 0) Help & quick info

```bash
docker --help
docker <command> --help
docker version
docker info
```

---

## 1) Containers (run, list, stop, remove)

### Run a container
```bash
docker run <image>
docker run --name <name> <image>
docker run -it <image>                 # interactive terminal
docker run -d <image>                  # detached (background)
docker run --rm <image>                # auto-remove when it exits
```

### Common run options
```bash
docker run -p 8080:80 <image>          # publish port host:container
docker run -e KEY=VALUE <image>        # set env var
docker run --env-file .env <image>     # env vars from file
docker run -v /host/path:/path <image> # bind mount
docker run -v <volume>:/path <image>   # named volume
docker run --network <network> <image> # attach to network
docker run --cpus="2" -m 2g <image>    # resource limits
```

### List containers
```bash
docker ps                               # running
docker ps -a                            # all (incl. stopped)
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
```

### Start/stop/restart
```bash
docker start <container>
docker stop <container>
docker restart <container>
docker kill <container>                 # force kill (SIGKILL)
```

### Inspect & details
```bash
docker inspect <container>
docker top <container>
docker stats                            # live resource usage
docker stats <container>
```

### Logs
```bash
docker logs <container>
docker logs -f <container>              # follow
docker logs --since 10m <container>
docker logs --tail 200 <container>
```

### Execute commands inside a running container
```bash
docker exec -it <container> /bin/bash
docker exec -it <container> sh
docker exec <container> <command>
```

### Attach to main process (careful)
```bash
docker attach <container>
```

### Copy files in/out
```bash
docker cp <container>:/path/in/container /host/path
docker cp /host/path <container>:/path/in/container
```

### Rename a container
```bash
docker rename <old_name> <new_name>
```

### Remove containers
```bash
docker rm <container>                   # stopped container
docker rm -f <container>                # force remove (even running)
docker container prune                  # remove stopped containers
docker rm $(docker ps -aq)              # remove all containers (danger)
```

---

## 2) Images (pull, build, tag, push, remove)

### Pull / list
```bash
docker pull <image>:<tag>
docker images
docker image ls
```

### Build images
```bash
docker build -t <name>:<tag> .
docker build -f Dockerfile -t <name>:<tag> .
docker build --no-cache -t <name>:<tag> .
docker build --platform linux/amd64 -t <name>:<tag> .
```

### Tag / push
```bash
docker tag <local_image>:<tag> <repo>/<image>:<tag>
docker push <repo>/<image>:<tag>
```

### Inspect & history
```bash
docker image inspect <image>
docker history <image>
```

### Remove images
```bash
docker rmi <image>
docker image prune                      # dangling images
docker image prune -a                   # unused images (danger)
```

---

## 3) Volumes (persistent data)

### List / inspect
```bash
docker volume ls
docker volume inspect <volume>
```

### Create / remove
```bash
docker volume create <volume>
docker volume rm <volume>
docker volume prune
```

### Use a volume in `docker run`
```bash
docker run -v <volume>:/data <image>
```

---

## 4) Networks (container connectivity)

### List / inspect
```bash
docker network ls
docker network inspect <network>
```

### Create / remove
```bash
docker network create <network>
docker network rm <network>
docker network prune
```

### Connect/disconnect containers
```bash
docker network connect <network> <container>
docker network disconnect <network> <container>
```

---

## 5) Docker Compose (multi-container apps)

> Uses `docker compose` (newer) instead of `docker-compose` (older).

### Start/stop
```bash
docker compose up
docker compose up -d
docker compose down
docker compose stop
docker compose start
docker compose restart
```

### Build & pull
```bash
docker compose build
docker compose pull
docker compose up --build
```

### Logs / exec
```bash
docker compose logs
docker compose logs -f
docker compose exec <service> bash
docker compose exec <service> sh
```

### List services/containers
```bash
docker compose ps
```

### Remove volumes too (destructive)
```bash
docker compose down -v
```

---

## 6) Cleanup & troubleshooting

### Disk usage
```bash
docker system df
```

### Prune unused resources
```bash
docker system prune                    # containers, networks, images (dangling)
docker system prune -a                 # includes unused images (danger)
docker system prune --volumes          # includes unused volumes (danger)
```

### Kill all running containers (nuclear)
```bash
docker ps -q | xargs -r docker kill
```

### Remove all stopped containers
```bash
docker container prune
```

### Remove all unused networks
```bash
docker network prune
```

### Remove all unused volumes
```bash
docker volume prune
```

---

## 7) Save / load / export (moving images and containers)

### Save/load images (preferred for moving images)
```bash
docker save -o image.tar <image>:<tag>
docker load -i image.tar
```

### Export/import container filesystem (not image metadata)
```bash
docker export -o container_fs.tar <container>
cat container_fs.tar | docker import - <new_image>:<tag>
```

---

## 8) Registries & login

```bash
docker login
docker logout
```

---

## 9) Contexts (switch Docker engines)

```bash
docker context ls
docker context use <context>
docker context inspect <context>
```

---

## 10) Buildx (multi-arch / advanced builds)

```bash
docker buildx version
docker buildx ls
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -t <name>:<tag> --push .
```

---

## 11) Handy one-liners

### Find containers by image
```bash
docker ps --filter "ancestor=<image>" --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
```

### Tail logs of the most recently started container
```bash
docker logs -f $(docker ps -q --latest)
```

---

## 12) Placeholder legend

- `<container>`: container ID or name (e.g., `a1b2c3d4e5f6` or `my-app`)
- `<image>`: image name (e.g., `ubuntu`, `nginx`, `myrepo/myapp`)
- `<tag>`: image tag (e.g., `latest`, `1.2.3`)
- `<volume>`: named volume (e.g., `pgdata`)
- `<network>`: network name (e.g., `backend`)
- `<service>`: compose service name from `compose.yaml`

---
