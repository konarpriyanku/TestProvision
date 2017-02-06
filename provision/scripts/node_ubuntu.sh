#!/usr/bin/env bash

echo 'Starting Provision: '$1

sudo apt-get update

echo "***********************************"
echo "Install and re-link node and npm..."
echo "***********************************"
sudo apt-get -y -qq install build-essential nodejs npm redis-server
sudo npm install -g forever

sudo ln -s "$(which nodejs)" /usr/bin/node


echo "***********************************"
echo "Run npm install and then run app..."
echo "***********************************"
cd /vagrant/provision/node/$1
sudo npm install
sudo forever start server.js
 


# let's get "node_modules" out of the synced folder
#sudo -rm -rf /var/www
#sudo mkdir /var/www
#sudo ln -s /home/vagrant/node_modules/ /var/www/node_modules

#npm install karma
#npm start


echo 'Provision web'$1 'complete'