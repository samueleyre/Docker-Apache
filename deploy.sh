#!/bin/bash
container='opnadminpreprod_apache_1';
env='staging'

# COLORED TEXT
TEXTCOLOR=$(tput setaf 0)$(tput setab 2)
RESETCOLOR=$(tput sgr0)
function colored(){
    [ $# -gt 1 ] && echo -n '> ' || echo -n '  '
    echo ${TEXTCOLOR}' '${1}' '${RESETCOLOR}
}

echo -n '  '${TEXTCOLOR}' environement endpoint ? '${RESETCOLOR}' (p) production, (s) staging, (d) development, (a) alex | default (s)' 
read choice

case $choice in
        p)
            env='production'
            ;;
        s)
            env='staging'
            ;;
        d)
            env='development'
            ;;
        a)
            env='alex'
            ;;
        *)
            env='staging'
        ;;
esac

echo -n '  '${TEXTCOLOR}' container ? '${RESETCOLOR}' (pp) pre production, (e) edouard | default (pp)' 
read choice

case $choice in
        pp)
            container='opnadminpreprod_apache_1'
            ;;
        e)
            container='admin_apache_1'
            ;;
        *)
            env='opnadminpreprod_apache_1'
            ;;
esac

colored 'removing old files' title
sudo rm -Rf html

colored 'stop container' title
sudo docker stop ${container}

colored 'clone repository' title
git clone --recursive git@github.com:OpnKitchenTeam/opnAdmin.git html

colored 'restart container' title
sudo docker-compose up -d

colored 'load dependencies' title
sudo docker exec -ti ${container} npm install
sudo docker exec -ti ${container} bower install --allow-root
sudo docker exec -ti ${container} gulp config --env=${env}
sudo docker exec -ti ${container} webpack
