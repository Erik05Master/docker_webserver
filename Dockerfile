FROM php:apache

WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libicu-dev \
        libxml2-dev \
        libonig-dev \
        wget \
        unzip \
        git \
        nano \
    && docker-php-ext-install -j$(nproc) iconv intl xml soap opcache pdo pdo_mysql mysqli mbstring

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    
USER www-data

COPY . /var/www/html
