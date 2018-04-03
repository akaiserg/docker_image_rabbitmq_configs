DOCKER RABBITMQ
---------------------

Docker file for redis wit config

Util commands
---------------------

docker build -t my_rabbitmq_image .


docker run --rm=true  -d --name my_rabbitmq_container -p 5672:5672 -p 15672:15672  my_rabbitmq_image


docker exec -it d5c bash

http://localhost:15672


