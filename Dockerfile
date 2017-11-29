FROM php:7-apache
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y  git zip \
    && rm -rf /var/lib/apt/lists/*
