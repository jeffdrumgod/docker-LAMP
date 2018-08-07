FROM php:5.6.37-apache-stretch

RUN set -ex;
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils

RUN apt-get install -y libmcrypt-dev \
    && docker-php-ext-install mcrypt \
    && apt-get install -y libicu-dev \
    && docker-php-ext-install -j$(nproc) intl \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

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
    && apt-get install -y libcurl3 \
    && apt-get install -y libcurl3-dev \
    && apt-get install -y firebird-dev \
    && apt-get install -y libpspell-dev \
    && apt-get install -y aspell-en \
    && apt-get install -y aspell-de \
    && apt-get install -y libtidy-dev \
    && apt-get install -y libsnmp-dev \
    && apt-get install -y librecode0 \
    && apt-get install -y librecode-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Install oAuth
RUN apt-get update \
	&& apt-get install gcc make autoconf libc-dev pkg-config -y \
	&& pecl install oauth-1.2.3 \
	&& echo "extension=oauth.so" > /usr/local/etc/php/conf.d/docker-php-ext-oauth.ini

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
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mysqli \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-install gd \
    && docker-php-ext-install curl \
    && docker-php-ext-install exif \
    && docker-php-ext-install fileinfo \
    && docker-php-ext-install gettext \
#   && apt-get install -y libgmp-dev # idk \
#   && docker-php-ext-install gmp # idk \
    && docker-php-ext-install iconv \
    && docker-php-ext-install interbase \
    && docker-php-ext-install pdo_firebird \
    && docker-php-ext-install opcache \
#   && docker-php-ext-install oci8 # idk \
#   && docker-php-ext-install odbc # idk \
    && docker-php-ext-install pcntl \
#   && apt-get install -y freetds-dev # idk \
#   && docker-php-ext-install pdo_dblib  # idk \
#   && docker-php-ext-install pdo_oci # idk \
#   && docker-php-ext-install pdo_odbc # idk \
#    && docker-php-ext-install phar \
    && docker-php-ext-install posix \
    && docker-php-ext-install pspell \
#   && apt-get install -y libreadline-dev # idk \
#   && docker-php-ext-install readline # idk \
    && docker-php-ext-install recode \
    && docker-php-ext-install shmop \
    && docker-php-ext-install simplexml \
    && docker-php-ext-install snmp \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install tidy \
    && docker-php-ext-install wddx \
    && docker-php-ext-install xml \
#   &&  apt-get install -y libxml2-dev # idk \
#   && docker-php-ext-install xmlreader # idk \
    && docker-php-ext-install xmlrpc \
    && docker-php-ext-install xmlwriter
#   && idk bz2 enchant

RUN a2enmod rewrite \
    && a2enmod rewrite expires \
    && a2enmod ssl

RUN mkdir -p  /etc/apache2/from-host \
    && cp -rf /etc/apache2/apache2.conf /etc/apache2/from-host/apache2.conf \
    && echo "" >> /etc/apache2/apache2.conf \
    && echo "# Include the configurations from the host machine" >> /etc/apache2/apache2.conf \
    && echo "IncludeOptional from-host/*.conf" >> /etc/apache2/apache2.conf

WORKDIR /var/www/html

EXPOSE 80 443
CMD ["apache2-foreground"]
