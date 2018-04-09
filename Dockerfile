FROM php:7-apache
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y --no-install-recommends git zip \
	    libfreetype6-dev \
	    libjpeg62-turbo-dev \
	    libpng-dev \
	    libmemcached-dev zlib1g-dev \
	    libgmp-dev libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install gmp pdo_mysql mbstring mcrypt mysqli opcache zip exif
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/freetype2 --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN pecl install memcached-3.0.4 \
&& docker-php-ext-enable memcached
RUN pecl install msgpack \
&& docker-php-ext-enable msgpack

RUN a2enmod rewrite expires
