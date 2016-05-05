#!/bin/bash
container='admin_apache_1';
env='staging'

git clone --recursive git@github.com:OpnKitchenTeam/opnAdmin.git html

docker exec -ti ${container} npm install
docker exec -ti ${container} bower install --allow-root
docker exec -ti ${container} gulp config --env=${env}
docker exec -ti ${container} webpack
