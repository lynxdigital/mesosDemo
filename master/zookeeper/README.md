ZooKeeper Image

Zookeeper Container Startup Command:
docker run -d --name zk -p 2888:2888/tcp -p 3888:3888/tcp -p 2181:2181/tcp -e ZK_ID=1 -e ZK_SERVERS="192.168.56.101" -e ZK_CLIENTPORT="2181" zookeeper

ZK_SERVERS not required
