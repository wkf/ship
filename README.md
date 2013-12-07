ship
====

Cloud deploys

requires
  node
  postgres
  git
  digital ocean
  vagrant
  docker
  dnsmasq
  haproxy

deploy APP:REF to ENV

deploy psdgrade staging


ship psdgrade [staging]

ship psdgrade master staging

ship psdlint

ship [APP] [REF] [ENV]


*continuous deployment
ship server gets request
verifies permissions
pulls branch
compiles build
builds docker images
pushes docker images to (local?) index
vagrant provision
swap DNS
reroute traffic through process
cleanup old instances


git fetch
git reset --hard origin/master


web
  nginx
  roots

api
  node
  sails(?)

redis/0mq

dns
  dnsmasq

proxy
  haproxy









