[start](https://docs.docker.com/get-started/#conclusion-of-part-one)

#### Start Up
`$ sudo apt install docker.io`

`$ docker --version`

`$ docker run hello-world`

If you get an error here about permissions, add your user to the docker grouo, then restart the OS.

`$ sudo usermod -aG docker $USER`

##### List all containers
`$ docker ps -a`

or

`$ docker container ls --all`

#### Define a Docker Container

A Docker container is defined by a `Dockerfile`, which specifies access to resources like networking interfaces and disk drives that are virtualized inside the environment.

Create an empty directory, create a file called `Dockerfile` in that directory, and then fill it with arguments that outline your containers resources. A sample is available in part 2 of the link above.

For example, you might make a seperate file called requirements.txt in the same directory

###### requirements.txt
```text
Redis
Flask
Seaborn
Pandas
```

then in `Dockerfile`, you could have the line
```
RUN pip install --trusted-host pypi.python.org -r requirements.txt
```
