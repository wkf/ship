FROM will/base
MAINTAINER wkf

RUN apt-get -qqy install python-software-properties
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get -qq update

RUN apt-get -qqy install ruby2.0 ruby2.0-dev rubygems ruby-switch
RUN ruby-switch --set ruby2.0

RUN gem install rake bundler --no-rdoc --no-ri

ENTRYPOINT ["ruby"]
