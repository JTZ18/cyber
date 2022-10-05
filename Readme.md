## Setup
List of useful commands to get started
```bash
# to build the environment
docker build .

# to run any commands in the environemnt
docker run --name myapp -i -t --rm cyber:latest

# to jump into the terminal of the container
docker exec -it myapp /bin/bash
```
