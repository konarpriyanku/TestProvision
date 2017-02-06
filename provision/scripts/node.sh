#!/usr/bin/env bash

echo 'Starting Provision: '$1

sudo yum update

sudo curl -sL https://rpm.nodesource.com/setup | sudo bash -
sudo yum install -y nodejs
sudo yum install -y gcc-c++ make


# let's get "node_modules" out of the synced folder
mkdir /home/vagrant/node_modules
cd /var/www/project
ln -s /home/vagrant/node_modules/ node_modules

#npm install karma
#npm start


echo 'Provision web'$1 'complete'