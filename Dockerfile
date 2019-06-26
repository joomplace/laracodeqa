FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip unzip libzip-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure zip --with-libzip && \
    docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql bcmath
RUN curl -sS https://getcomposer.org/installer | php && \
    chmod a+x composer.phar && \
    mv composer.phar /usr/local/bin/composer

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

WORKDIR /app
CMD ["composer","require","--dev","nunomaduro/larastan","&&","php","artisan","code:analyse"]
#ENTRYPOINT /entrypoint.sh
