FROM tutum/apache-php

# FIX Apache/PHP write permissions to the app
#ENV BOOT2DOCKER_ID 1000
#ENV BOOT2DOCKER_GID 50
#RUN usermod -u ${BOOT2DOCKER_ID} www-data && \
#    usermod -G staff www-data
#RUN groupmod -g $(($BOOT2DOCKER_GID + 10000)) $(getent group $BOOT2DOCKER_GID | cut -d: -f1)
#RUN groupmod -g ${BOOT2DOCKER_GID} staff

RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      git \
      curl \
      sqlite3 \
      php5 \
      php5-curl \
      php5-fpm \
      php5-intl \
      php5-sqlite \
      php5-pgsql \
      php5-mysql \
      php5-memcache \
      php-apc \
      supervisor \
    && rm -rf /var/lib/apt/lists/*

# Add image configuration and scripts
ADD apache.sh /apache.sh
RUN chmod 755 /*.sh

WORKDIR /var/www/symfony

#USER www-data

EXPOSE 80

CMD ["/apache.sh"]