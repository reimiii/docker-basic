docker volume create mysqlrestore

docker container run --rm --name ubunturestore \
--mount "type=bind,source=/home/darkn/Dev/Database/backup/mysql,destination=/backup" \
--mount "type=volume,source=mysqlrestore,destination=/data" ubuntu:latest \
bash -c "cd /data && tar xvf /backup/backup2.tar.gz --strip 1"

docker container create --name mysqlnew --publish 3306:3306 --mount \
"type=volume,source=mysqlrestore,destination=/var/lib/mysql" \
--env MYSQL_ROOT_PASSWORD=password mysql:8.0

docker container start mysqlnew