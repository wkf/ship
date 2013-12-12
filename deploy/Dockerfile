FROM will/base
MAINTAINER wkf

RUN apt-get install -qqy iptables ca-certificates lxc
ADD Dockerfile Dockerfile
ADD https://get.docker.io/builds/Linux/x86_64/docker-latest /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker
VOLUME ["/var/lib/docker"]

run latest build
commit


git fetch && git reset --hard origin/master

run ship build
run ship run

roots compile


chef.add_recipe 'docker'


build:
  roots compile

start:
  nginx


chef.add_recipe 'node'
chef.add_recipe 'nginx'

build 'roots compile'
start 'nginx'

FROM ubuntu
MAINTAINER wkf

RUN /app/build/install_node.sh
RUN /app/build/install_nginx.sh


RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN echo <<-SHELL
  #!/bin/sh

  cd /app
  git fetch
  git reset --hard origin/master

  roots compile

  cp config/nginx.conf /etc/nginx/sites-available/default

SHELL >> build

RUN echo <<-SHELL
  #!/bin/sh

  nginx
SHELL >> start

RUN chmod +x build start


VOLUME ["/public"]

EXPOSE 80

CMD ["nginx"]
