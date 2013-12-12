FROM ubuntu

MAINTAINER wkf

# this forces dpkg not to call sync() after package extraction and speeds up install,
# and we don't need and apt cache in a container, so disable it
# and then update our sources
RUN (echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup) && \
    (echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache) && \
    (echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list)

RUN apt-get -qq update && \
    apt-get -qq upgrade
