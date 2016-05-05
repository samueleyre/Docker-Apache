#!/bin/bash
container='opnadminpreprod_apache_1';
env='staging'

sudo rm -Rf html

sudo docker stop ${container}

git clone --recursive git@github.com:OpnKitchenTeam/opnAdmin.git html

sudo docker-compose up -d

sudo docker exec -ti ${container} npm install
sudo docker exec -ti ${container} bower install --allow-root
sudo docker exec -ti ${container} gulp config --env=${env}
sudo docker exec -ti ${container} webpack
