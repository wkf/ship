FROM will/base
MAINTAINER wkf

RUN apt-get install -qqy iptables ca-certificates lxc
ADD Dockerfile Dockerfile
ADD https://get.docker.io/builds/Linux/x86_64/docker-latest /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker
VOLUME ["/var/lib/docker"]
