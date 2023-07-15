docker volume create data-for-mongo

docker container create --name mongovolume --publish 27019:27017 \
--mount "type=volume,source=data-for-mongo,destination=/data/db" \
--env MONGO_INITDB_ROOT_USERNAME=mee --env MONGO_INITDB_ROOT_PASSWORD=mee mongo:latest

docker container stop mongovolume