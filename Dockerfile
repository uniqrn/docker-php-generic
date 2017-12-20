FROM php:7-apache
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y  git zip php7.0-mysql php7.0-gd \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite expires
