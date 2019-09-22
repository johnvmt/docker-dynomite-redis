# Docker image with [Dynomite](https://github.com/Netflix/dynomite/) and Redis

The image is on Dockerhub as [johnvmt/dynomite-redis](https://hub.docker.com/r/johnvmt/dynomite-redis)

The default configuration is for a single note in standalone mode. To override the configuration, mount your configuration file to /dynomite/config/dynomite.yaml in the container

``$ docker run -d -p 8101:8101 -p 8102:8102 --name mydatabase -v /host/directory/dynomite.yaml:/dynomite/config/dynomite.yaml johnvmt/dynomite-redis``
 
For configuration and architecture options, see the [Dynomite project](https://github.com/Netflix/dynomite/) documentation