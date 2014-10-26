Mesos Master Container

docker run -i -t --rm --name mesos -p 5050:5050/tcp -p 8080:8080/tcp --link zk:zk mesos
