def build_image(name, path=nil)
  path = "/vagrant/#{name}/Dockerfile" unless path.present?

  <<-SHELL
    sudo docker build -t registry.ship/#{name} #{path}
    sudo docker push registry.ship/#{name}
  SHELL
end

# VERSION = ENV.fetch('SHIP_VERSION')

Vagrant.configure("2") do |config|
  config.vm.box      = 'precise64'
  config.vm.network    'forwarded_port', guest: 80, host: 8080, auto_correct: true

  # config.berkshelf.enabled    = true
  # config.omnibus.chef_version = :latest

  # config.vm.provision.docker.registry 'registry:80'

  # config.docker_images do
  #   image 'web',
  #   image 'app'
  # end

  # config.vm.provision :chef_solo do |chef|
  #   chef.add_recipe 'docker'
  # end

  config.vm.provision :shell, inline: <<-SHELL
    if !(grep -qx "127\.0\.0\.1\s\s*registry\.ship" /etc/hosts)
    then
      echo '127.0.0.1 registry.ship' >> /etc/hosts
      apt-get update
    fi
  SHELL

  config.vm.provision :docker do |d|
    d.pull_images 'stackbrew/registry'
    d.run 'stackbrew/registry',
      args:
        "-p 80:5000 \
         -e SETTINGS_FLAVOR=prod \
         -e S3_BUCKET=mojo-registry \
         -e AWS_ACCESS_KEY_ID=#{ENV.fetch('AWS_ACCESS_KEY_ID')} \
         -e AWS_SECRET_KEY=#{ENV.fetch('AWS_SECRET_KEY')}"
  end

    # build ours here

  # config.vm.provision :shell, inline: build_image('base')


    # config.vm.provision :docker do |d|
    #   d.run
    # end

    # mojotech.ship.api
    # registry.vm.provision :shell, inline: build_image('api')
    # registry.vm.provision :shell, inline: build_image('dns')
    # registry.vm.provision :shell, inline: build_image('proxy')

#     image_name(role: :app)

# registry.ship/ORGANIZATION-NAME-ROLE:VERSION

  # config.vm.provision :docker do |d|
    # d.run 'api', image: 'registry.ship/api'
    # d.run 'dns', image: 'registry.ship/dns'
    # d.run 'proxy' image: 'registry.ship/proxy'
  # end
end
