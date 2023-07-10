docker image pull nginx:stable

docker container create --name webserver --publish 8080:80 nginx:stable