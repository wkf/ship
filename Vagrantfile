Vagrant.configure("2") do |config|
  config.vm.box      = 'precise64'
  config.vm.network    'forwarded_port', guest: 80, host: 8080, auto_correct: true

  config.berkshelf.enabled    = true
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'docker'
  end
end
