# DOCKER-VERSION 1.1.2

FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:chris-lea/node.js

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update

RUN apt-get install -y nodejs wget zip mongodb-org

RUN service mongod start

RUN npm install -g forever

ADD deploy/boardgamedb_server.tar.gz /opt/boardgamedb/server

WORKDIR /opt/boardgamedb/server

RUN npm install .

EXPOSE 32000

CMD ["forever", "server.js"]
