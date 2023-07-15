docker container stop # name

docker container create --name mysqlvolume --publish 3307:3306 --mount \
"type=volume,source=mysqld,destination=/var/lib/mysql" \
--env MYSQL_ROOT_PASSWORD=password mysql:8.0

docker container stop mysqlvolume

docker container create --name nginxbackup \
--mount "type=bind,source=/home/darkn/Dev/Database/backup/mysql,destination=/backup" \
--mount "type=volume,source=mysqld,destination=/data" \
nginx:stable

/home/darkn/Dev/Database/backup/mysql


docker container exec -i -t nginxbackup /bin/bash

tar cvf /backup/backup.tar.gz /data

exit

docker container stop nginxbackup

docker container rm nginxbackup

docker container start mysqlvolume

docker image pull ubuntu:latest

docker container stop mysqlvolume

docker container run --rm --name ubuntubackup \
--mount "type=bind,source=/home/darkn/Dev/Database/backup/mysql,destination=/backup" \
--mount "type=volume,source=mysqld,destination=/data" ubuntu:latest \
tar cvf /backup/backup2.tar.gz /data

docker container start mysqlvolume