# Docker
## Docker definition
Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and ship it all out as one package.

## advantages
- **Lightweight** - Containers running on a single machine all share that machine's operating system kernel; they start instantly and use less RAM.
- **Standard** - Containers are on standard and predictable environment that can be easily reproduced.
- **Secure** - Containers apply aggressive constraints and isolations to processes without any configuration required on the part of the user.
- **Portable** - Containers can be created and tested on a laptop and deployed on a cloud server.
- **Easy Configuration** - Containers can be created and deployed from a simple set of instructions (known as a Dockerfile) and a single container image.
- **Easy to Share** - Docker Hub makes it easy to share containers and automate workflows.


## Dockerfile


## Starting a Docker container
- The Long way
``` bash
docker create hello-world
docker start -a <container-id> #first 3 letter should do.
```
- the Short way
```bash
docker run -it --rm -p 8080:80 nginx
```

- get logs
```bash
docker logs <container-id>
```

- stop a container
```bash
docker stop <container-id>
```

- list containers
```bash
docker ps #list running containers
docker ps --all #list all containers
```

- build a custom container
```bash
docker build -t <docker-id>/<repo-name>:<version> . #the dot is important (it specifies where to look for the Dockerfile)
docker build -t <docker-id>/<repo-name>:latest -f app.DockerFile .  # use a custom name
```

- get an interactive bash
```bash
docker exec -it <container-id> bash
```

- stop a container 
```bash
docker stop <container-id> #stops gracefully
docker stop -t 0 <container-id> #stops immediately
```

- remove container
```bash
docker rm <container-id>
docker ps -aq | xargs docker rm #remove all containers
docker rm -f <image-name>/ <container-id> # stop and remove container
```

- remove image
```bash
docker rmi <image-id>
docker images -aq | xargs docker rmi #remove all images
```

- kill containers
```bash
docker kill $(docker ps -q) #kills all running containers
docker kill <container-id> # kills one container
```

- bind a container port to a host port
```bash
docker run -p 5001:5000 <image-name>
```

- bind a container volume to a host volume
```bash
# -v <host-volume>:<container-volume>
# -rm removes the container after it exits
# --entrypoint overrides the default entrypoint: in the example below, we are using an ubuntu shell 
# -c runs the command

# the below command echoes hello to a file in the host volume /tmp/container
docker run --rm --entrypoint  sh -v /tmp/container:/tmp/ ubuntu -c "echo 'hello' > /tmp/hello.txt" 

# assume you have a file called sample_file.txt in the host volume /tmp/container
touch /tmp/container/sample_file.txt
docker run --rm --entrypoint  sh -v /tmp/container/sample_file.txt:/tmp/hello.txt ubuntu -c "cat /tmp/hello.txt" 
# in the case of a non-existing file in the host volume, the container will create a directory instead of a file. 
``` 
**Always map a volume to a directory, not a file.**


- Login to docker hub and push an image to the registry
*Best practice*: Name your image with your docker id and the repo name with a versioning tag.
`format` = <docker-id>/<repo-name>:<version>
```bash
docker login
docker tag <old-image-name> <new-image-name> #tag the image 
docker push <new-image-name> 
```
 - create a new version for your docker image
```bash
docker build -t <docker-id>/<repo-name>:<version> .
docker push <docker-id>/<repo-name>:<version>
```


## Debugging Docker containers
- Use Docker stats to get the cpu and memory usage of a container
```bash
docker stats # get the stats of all running containers
docker stats <container-id> # get the stats of a specific container
```

- use docker inspect to get a json representation of the container
```bash
docker inspect <container-id> # get info about the container
```

- use docker top to get the top command executed inside your container
```bash 
docker top <container-id> # get the running processes in the container
```