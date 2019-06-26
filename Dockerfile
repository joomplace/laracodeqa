FROM php:7.2-fpm

RUN docker-php-ext-install pdo pdo_mysql bcmath
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php && \
    chmod a+x composer.phar && \
    mv composer.phar /usr/local/bin/composer

ADD ./entrypoint.sh /entrypoint.sh

WORKDIR /app
ENTRYPOINT /entrypoint.sh
