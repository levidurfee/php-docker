# Set the base image for subsequent instructions
FROM php:7.3

# Update packages
RUN apt-get update

# Install PHP and composer dependencies
RUN apt-get install -qq git curl libzip-dev libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libgmp-dev re2c libmhash-dev

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/

# Clear out the local repository of retrieved package files
RUN apt-get clean

# Install needed extensions
# Here you can install any other extension that you need during the test and deployment process
RUN docker-php-ext-install pdo_mysql zip bcmath gmp

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel Envoy
RUN composer global require "laravel/envoy=~1.0"
