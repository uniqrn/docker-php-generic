FROM php:7.0-apache
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y --no-install-recommends git zip \
	    libfreetype6-dev \
	    libjpeg62-turbo-dev \
	    libpng-dev \
	    libmemcached-dev zlib1g-dev \
	    libgmp-dev libmcrypt-dev \
	    libicu52 fontconfig libxrender1 xfonts-base xfonts-75dpi \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install gd gmp pdo_mysql mbstring mcrypt mysqli opcache
RUN pecl install memcached-3.0.4 \
&& docker-php-ext-enable memcached
RUN pecl install msgpack \
&& docker-php-ext-enable msgpack

RUN curl -L -O https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb
RUN dpkg -i wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb

RUN a2enmod rewrite expires
