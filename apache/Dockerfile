FROM tutum/apache-php

RUN usermod -u 1000 www-data


RUN apt-get update && apt-get install -y --no-install-recommends \
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


# Add image configuration and scripts
ADD apache.sh /apache.sh
RUN chmod 755 /*.sh

WORKDIR /var/www/html

#USER www-data

EXPOSE 80

CMD ["/apache.sh"]