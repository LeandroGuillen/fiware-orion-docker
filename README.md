# FIWARE Orion Context Broker Dockerfile

Try [Orion Context Broker](https://github.com/telefonicaid/fiware-orion) in your own computer easily and hassle free!

Orion Context Broker is part of [FIWARE](http://www.fiware.org/).

This repository contains a docker file to build FIWARE Orion Context Broker docker image. If you just want to run it simply do

    docker pull leandroguillen/fiware-orion
    
... follow the next guidelines.

# Requistes

You need to have a running instance of MongoDB. Version 2.4 is supported and 2.6 is known to work.

# Running
In its simplest form, just do:

    sudo docker run -t -i --name orion -p 1026:1026 leandroguillen/fiware-orion -fg

You will get control of the console. Press `Control+C` to turn Orion off. Now if you want to run it again you may do

    sudo docker restart orion

This will launch it in daemon mode. To stop it do

    sudo docker stop orion

## Using a dockerized MongoDB instance
This is a useful way to run it if you want to look at the output of Orion, or specify a mongodb host.

    sudo docker run -t -i --name orion -p 1026:1026 leandroguillen/fiware-orion -fg -t 0-255 -dbhost <mongo_host>

Where `<mongo_host>` is the IP of the runing mongo. You can ommit it if mongo is running in localhost. It is useful if you have mongo also dockerized. For example:

    sudo docker run --name mongo24 -d mongo:2.4

Use `sudo docker inspect mongo24 | grep IPAddress` to get the IP of the mongodb server.

# Testing

To see that everything went ok do

    curl localhost:1026/version

