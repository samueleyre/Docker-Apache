#!/bin/bash

cp /root/docker/OpnDocker/ambrieu/data/password_admin.ini /tmp/password_admin.ini

rm -Rf /root/docker/OpnDocker/ambrieu

git clone git@objetspartages.org:blog-generator.git /root/docker/OpnDocker/ambrieu/


cp /tmp/password_admin.ini /root/docker/OpnDocker/ambrieu/data/password_admin.ini

chown -R www-data:www-data /root/docker/OpnDocker/abrieu/data/

cd /root/docker/OpnDocker/ambrieu/

curl -sS https://getcomposer.org/installer | php

php composer.phar install

bower --allow-root install

echo "<?php define('LOCAL',false);" > /root/docker/OpnDocker/ambrieu/data/env.php

