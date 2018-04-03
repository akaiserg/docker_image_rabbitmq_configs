#!/bin/sh

# Create Default RabbitMQ setup
( sleep 10 ; \

# Enable plugins
# rabbitmqctl enable <plugin name>
rabbitmq-plugins enable rabbitmq_management ; \

# Create users
# rabbitmqctl add_user <username> <password>
rabbitmqctl add_user admin f0d3b168-d79d-488e-807b-5a3872396b53 ; \

rabbitmqctl add_user producer f64cb7dc-e335-4c57-b222-420009066fbc ; \

rabbitmqctl add_user consumer_1 e342d5fc-c242-44be-865d-f461571aa316 ; \

rabbitmqctl add_user consumer_2 50ce872c-e77f-4aee-b9e0-607578b63216 ; \

# Set user rights
# rabbitmqctl set_user_tags <username> <tag>
rabbitmqctl set_user_tags admin administrator ; \

# Create vhosts
# rabbitmqctl add_vhost <vhostname>
rabbitmqctl add_vhost dummy ; \

# Set vhost permissions
# rabbitmqctl set_permissions -p <vhostname> <username> ".*" ".*" ".*"
rabbitmqctl set_permissions -p dummy admin ".*" ".*" ".*" ; \

# to see the data on the web page
rabbitmqctl set_permissions -p / admin ".*" ".*" ".*" ; \

rabbitmqctl set_permissions -p dummy producer_front_log ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p / producer_front_log ".*" ".*" ".*" ; \

rabbitmqctl set_permissions -p dummy consumer_log_elk ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p / consumer_log_elk ".*" ".*" ".*" ; \

rabbitmqctl set_permissions -p dummy consumer_log_bd ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p / consumer_log_bd ".*" ".*" ".*" ; \
) &    
rabbitmq-server $@