NOTES

Attempts To Run Docker In Docker - FAILING
docker run -i -t  --rm -v /sys:/sys -v /var/lib/docker:/var/lib/docker -v /var/run/docker.sock:/var/run/docker.sock -v /cgroup:/cgroup --privileged --link zookeeper:zk mesos:slave /bin/bash

Starting App Container
docker run -d -p 80:80/tcp myapp

Curl Command To Start App Im Marathon
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" \
    192.168.56.101:8080/v2/apps -d '{
		  "id": "myapp",
		    "container": {
				    "docker": {
						      "image": "localhost:5000/myapp:latest"
							      },
								      "type": "DOCKER"
									    },
										  "cpus": 0.1,
										    "instances": 1,
											  "mem": 100
	}'
