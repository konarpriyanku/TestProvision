# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
current_dir    = File.dirname(File.expand_path(__FILE__))
#settings = YAML.load_file("#{current_dir}/settings.yaml")
VAGRANTFILE_API_VERSION = "2"
HOSTS = { "redismaster" => "192.168.57.2",
          "redisslave1" => "192.168.57.3",
          "redisslave2" => "192.168.57.4"
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
HOSTS.each do |r|
    config.vm.define r[0] do |v|
     v.vm.provision :shell do |sh|
          sh.name = "redis provisioner"
          sh.args=[r[0]]
          sh.path= "provision/scripts/redis.sh"
        end
      v.vm.box = 'woznial/centos-7.2'
      v.vm.box_check_update = false
      v.vm.network :private_network, ip: r[1]
      v.vm.hostname = r[0]
    end
end

     
config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end


end