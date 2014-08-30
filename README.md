# TokuMX Docker container

## Setup on the host

You may have to run the following command on the Docker HOST server before
Starting the container.

    sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled

## Build the container

    docker build -t tokumx

## Start the container

    docker run -d --name tokumx -p 27017:27017 -p 28017:28017 -v $(pwd)/data:/var/lib/tokumx -v $(pwd)/log:/var/log/tokumx/ tokumx

## To use the client to connect to the database

    docker run --rm -t -i --link tokumx:tokumx hbouvier/tokumx bash -c 'mongo ${TOKUMX_PORT_27017_TCP_ADDR}:${TOKUMX_PORT_27017_TCP_PORT}/test'
