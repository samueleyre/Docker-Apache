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
      vim \
    && rm -rf /var/lib/apt/lists/*

# install front
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

RUN a2enmod rewrite

## Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install --yes nodejs

RUN curl -L https://www.npmjs.com/install.sh | sh

RUN npm install -g bower

RUN npm install -g gulp

RUN npm install -g webpack

# Add image configuration and scripts
ADD apache.sh /apache.sh
RUN chmod 755 /*.sh

WORKDIR /var/www/html

#USER www-data

EXPOSE 80

CMD ["/apache.sh"]
