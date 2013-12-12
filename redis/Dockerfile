FROM will/base
MAINTAINER wkf

RUN apt-get -qqy install wget make gcc
RUN wget http://download.redis.io/releases/redis-2.8.3.tar.gz
RUN tar xzf redis-2.8.3.tar.gz
RUN cd redis-2.8.3 && make
RUN echo 1 > /proc/sys/vm/overcommit_memory
ADD ./redis.conf /etc/redis.conf

EXPOSE 6379

ENTRYPOINT ["/redis-2.8.3/src/redis-server"]
CMD ["/etc/redis.conf"]
