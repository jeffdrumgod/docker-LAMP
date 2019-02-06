FROM php:7.2-apache-stretch

RUN set -ex;
RUN apt-get update --fix-missing \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils

RUN apt-get install -y libicu-dev \
    && docker-php-ext-install -j$(nproc) intl \
    && apt-get install -y libfreetype6-dev libjpeg-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --enable-gd-native-ttf --with-freetype-dir=/usr/include/freetype2 --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd


RUN apt-get install -y libxml2-dev \
    && apt-get install -y libldb-dev \
    && apt-get install -y libldap2-dev \
    && apt-get install -y libxml2-dev \
    && apt-get install -y libssl-dev \
    && apt-get install -y libxslt-dev \
    && apt-get install -y libpq-dev \
    && apt-get install -y mysql-client \
    && apt-get install -y libsqlite3-dev \
    && apt-get install -y libsqlite3-0 \
    && apt-get install -y libc-client-dev \
    && apt-get install -y libkrb5-dev \
    && apt-get install -y curl \
    && apt-get install -y libcurl3-dev \
    && apt-get install -y firebird-dev \
    && apt-get install -y librecode0 \
    && apt-get install -y librecode-dev \
    && apt-get install -y libmemcached-dev \
    && apt-get install -y libxml2-dev \
    && apt-get install -y libxslt1-dev \
    && pecl install redis \
    && docker-php-ext-enable redis.so


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN docker-php-ext-install ftp \
    && docker-php-ext-install soap \
    && docker-php-ext-install xsl \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install calendar \
    && docker-php-ext-install ctype \
    && docker-php-ext-install dba \
    && docker-php-ext-install dom \
    && docker-php-ext-install zip \
    && docker-php-ext-install session \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
    && docker-php-ext-install ldap \
    && docker-php-ext-install json \
    && docker-php-ext-install hash \
    && docker-php-ext-install sockets \
    && docker-php-ext-install pdo \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install tokenizer \
    && docker-php-ext-install pgsql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_sqlite \
    && docker-php-ext-install intl \
    && docker-php-ext-install mysqli \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-install curl \
    && docker-php-ext-install exif \
    && docker-php-ext-install fileinfo \
    && docker-php-ext-install gettext \
    && docker-php-ext-install iconv \
    && docker-php-ext-install interbase \
    && docker-php-ext-install pdo_firebird \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install posix \
    && docker-php-ext-install recode \
    && docker-php-ext-install shmop \
    && docker-php-ext-install simplexml \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install wddx \
    && docker-php-ext-install xml \
    && docker-php-ext-install xmlrpc \
    && docker-php-ext-install xmlwriter

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN a2enmod rewrite \
    && a2enmod rewrite expires \
    && a2enmod ssl

RUN mkdir -p  /etc/apache2/from-host \
    && cp -rf /etc/apache2/apache2.conf /etc/apache2/from-host/apache2.conf \
    && echo "" >> /etc/apache2/apache2.conf \
    && echo "# Include the configurations from the host machine" >> /etc/apache2/apache2.conf \
    && echo "IncludeOptional from-host/*.conf" >> /etc/apache2/apache2.conf

RUN apt-get purge -y --auto-remove $buildDeps \
    && rm -r /var/lib/apt/lists/*

WORKDIR /var/www/html

EXPOSE 80 443
CMD ["apache2-foreground"]
