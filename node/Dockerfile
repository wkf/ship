FROM will/base
MAINTAINER wkf

RUN apt-get -qqy install python-software-properties python g++ make software-properties-common dialog
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get -qq update
RUN apt-get -qqy install nodejs

ENTRYPOINT ["node"]
