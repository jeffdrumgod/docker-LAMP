FROM debian:stretch

RUN set -ex;
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y libicu-dev
RUN apt-get install -y mariadb-client
RUN apt-get install -y php7.0
RUN apt-get install -y php7.0-mysql
RUN apt-get install -y apache2
RUN apt-get install -y apache2-mod-php7.0
RUN mkdir -p  /etc/apache2/from-host

RUN cp -rf /etc/apache2/apache2.conf /etc/apache2/from-host/apache2.conf
RUN echo "" >> /etc/apache2/apache2.conf \
    && echo "# Include the configurations from the host machine" >> /etc/apache2/apache2.conf \
    && echo "IncludeOptional from-host/*.conf" >> /etc/apache2/apache2.conf

RUN a2enmod rewrite expires

CMD ["apache2-foreground"]
