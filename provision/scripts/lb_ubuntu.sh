#!/usr/bin/env bash
echo "running set up for load balancer..."

# nginx
sudo apt-get -y install nginx
sudo service nginx stop

# set up nginx server
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
sudo cp /vagrant/provision/nginx/nginx.conf /etc/nginx/sites-available/app.dev.com
sudo chmod 644 /etc/nginx/sites-available/app.dev.com
sudo ln -s /etc/nginx/sites-available/app.dev.com /etc/nginx/sites-enabled/app.dev.com

sudo cp /vagrant/provision/nginx/nginx2.conf /etc/nginx/sites-available/app.dev2.com
sudo chmod 644 /etc/nginx/sites-available/app.dev2.com
sudo ln -s /etc/nginx/sites-available/app.dev2.com /etc/nginx/sites-enabled/app.dev2.com

sudo cp /vagrant/provision/nginx/nginx3.conf /etc/nginx/sites-available/app.dev3.com
sudo chmod 644 /etc/nginx/sites-available/app.dev3.com
sudo ln -s /etc/nginx/sites-available/app.dev3.com /etc/nginx/sites-enabled/app.dev3.com

# clean /var/www
#sudo rm -Rf /var/www

# symlink /var/www => /vagrant
sudo ln -s /vagrant/provision/nginx/public /var/www
sudo service nginx start
echo 'Provision loadbalancer complete...'

