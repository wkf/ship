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


Imagesfile

config.vm.promision :docker do |docker|
  docker.registry 'localhost:5000'
  docker.build 'app', path: 'app/Dockerfile', commit: true
  docker.build 'web', path: 'web/Dockerfile', commit: true
  docker.run 'app'
end


Vagrant.configure("2") do |config|
  config.vm.provision "docker" do |d|
    d.run 'web', args: '-v /web/public:/public'
  end
end


# repo -> prebuild -> build -> postbuild

Images.configure('1') do |config|
  registry 'localhost:5000'

  image 'app', path: 'app/Dockerfile'
  image 'web', path: 'web/Dockerfile'
end

'ORGANIZATION/APP:ROLE-VERSION'


INDEX = ENV.fetch('DOCKER_INDEX_URL')


"#{INDEX}/app:latest"



use docker image as build cache


