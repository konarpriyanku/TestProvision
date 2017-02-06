
Vagrant.configure("2") do |config|

  #config.vm.box = 'woznial/centos-7.2'
  config.vm.box ='ubuntu/trusty32'
  config.vm.box_check_update = false
  #config.vm.synced_folder "./", "/home/vagrant", create: true
 # config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

 config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

 # VM Settings for load balancer
      config.vm.define :lbalancer do |lb|
        lb.vm.hostname = 'pkonar.lb'
        lb.vm.network "private_network", ip: "10.1.1.10" 
        lb.vm.network "forwarded_port",  host: 8081,guest: 8081, auto_correct: true
        lb.vm.provision :shell do |sh|
          sh.name = "loadbalancer provisioner"
          sh.args=['arg1','arg2','arg3']
          sh.path= "provision/scripts/lb_ubuntu.sh"
        end
      end


      # VM Settings for node app 1
      config.vm.define :node_one do |node_one|
        node_one.vm.hostname = 'pkonar.node.one'
        node_one.vm.network "private_network", ip: "10.1.1.20"
        node_one.vm.provision :shell do |sh|
          sh.name = "appserver1 provisioner"
          sh.args=['sample-app']
          sh.path= "provision/scripts/node_ubuntu.sh"
          end
      end

      
end