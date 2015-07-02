Try [Orion Context Broker](https://github.com/telefonicaid/fiware-orion) in your own computer easily and hassle free!

Orion Context Broker is part of [FIWARE](http://www.fiware.org/).

See the [Dockerfile and Compose files here](https://github.com/LeandroGuillen/fiware-orion-docker).

# Requistes

You need to have a running instance of MongoDB. Versions from 2.4 to 3.0 are known to work.

# Running
In its simplest form, just do:

    sudo docker run -t -i --name orion -p 1026:1026 leandroguillen/fiware-orion -fg

> **NOTE**: The `-fg` is a parameter that is passed to Orion. In fact, everything after `leandroguillen/fiware-orion` is a parameter for Orion. Take a look at [all available parameters](http://forge.fiware.org/plugins/mediawiki/wiki/fiware/index.php/Publish/Subscribe_Broker_-_Orion_Context_Broker_-_Installation_and_Administration_Guide#Command_line_options).

Now Orion runs on a console. Press `Control+C` to turn Orion off. Now if you want to run it again you may do

    sudo docker restart orion

This will launch it in daemon mode. To stop it do

    sudo docker stop orion

## Using a dockerized MongoDB instance
This is a useful way to run it if you want to look at the output of Orion, or specify a mongodb host.

    sudo docker run -t -i --name orion -p 1026:1026 leandroguillen/fiware-orion -fg -t 0-255 -dbhost <mongo_host>

Where `<mongo_host>` is the IP of the runing mongo. You can ommit it if mongo is running in localhost. Run your mongo also dockerized for extra bonus points :) For example:

    sudo docker run --name mongo24 -d mongo:2.4

Use `sudo docker inspect mongo24 | grep IPAddress` to get the IP of the mongodb server.

# With docker-compose (an even easier way)

For this to work you have to install [docker-compose](https://docs.docker.com/compose/).

    orion:
      image: leandroguillen/fiware-orion
      links:
        - mongo
      ports:
        - "1026:1026"
      command: -fg -t 0-255 -dbhost mongo

    mongo:
      image: mongo:latest

Then type in your terminal:

    docker-compose up

Now you have two dockers running, one for Orion and one for MongoDB, that are connected to each other.

# Testing

To see that everything went ok do

    curl localhost:1026/version

