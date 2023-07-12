docker image pull mongo:latest

docker container create --name databasemongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=mee --env MONGO_INITDB_ROOT_PASSWORD=mee mongo:latest