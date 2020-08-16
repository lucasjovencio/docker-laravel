FROM php:7.3-fpm
COPY ./src/project /var/www/html
WORKDIR /var/www/html
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libmcrypt-dev \
    libxslt-dev \
    libicu-dev \
    libmemcached-dev \
    zlib1g-dev \
    libmagickwand-dev \
    libmagickcore-dev \
    libgeoip-dev \
    libsodium-dev \ 
    curl \
    unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    pecl install redis xdebug && \
    docker-php-ext-enable redis  && \
    docker-php-ext-install exif \
    pdo_mysql \
    mysqli \
    xsl \
    xml \
    intl \
    soap \
    mbstring \
    bcmath \
    xsl \
    sockets && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

RUN usermod -u 1000 www-data && \
    groupmod -g 1000 www-data && \
    chown -R www-data:www-data /var/www/ && \
    chmod -R g+w /var/www/

USER www-data