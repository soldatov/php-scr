FROM php:8.1-alpine3.15

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apk update && apk add --update linux-headers && apk add zip unzip \
    && install-php-extensions xdebug mysqli pdo_mysql \
    && cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

COPY ./99-xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini

WORKDIR /app
