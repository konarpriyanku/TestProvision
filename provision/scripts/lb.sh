#!/usr/bin/env bash
echo "running set up for load balancer..."

# rpm -q mc &> /dev/null || yum install -q -y mc

sudo yum -y update

rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
sudo yum install -y nginx

sudo systemctl enable nginx
sudo service nginx stop
#sudo rm -rf /etc/nginx/conf.d/default.conf


#sudo cp /vagrant/provision/nginx/nginx.conf /etc/nginx/conf.d/default.conf
#sudo chmod 644 /etc/nginx/conf.d/default.conf


#sudo rm -Rf /var/www

# symlink /var/www => /vagrant
#sudo ln -s /vagrant/provision/nginx/public /var/www/public

sudo systemctl start nginx
sudo service nginx start
echo 'Provision loadbalancer complete...'

