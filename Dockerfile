FROM php:7-apache
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y git zip \
	    libfreetype6-dev \
	    libjpeg62-turbo-dev \
	    libpng12-dev \
	    libmemcached-dev zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install gd pdo_mysql mbstring
RUN pecl install memcached-2.2.0 \
&& docker-php-ext-enable memcached

RUN a2enmod rewrite expires
