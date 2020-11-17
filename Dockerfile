FROM php:7.1.8-apache

COPY /htdocs /var/www/html
#COPY .docker/vhost.conf /etc/apache2/sites-available/simple-api.conf
#COPY .docker/vhost-ssl.conf /etc/apache2/sites-available/simple-api-ssl.conf
#COPY .docker/certificate.conf /etc/ssl/certs/certificate.conf
COPY .docker/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www/html

#RUN docker-php-ext-install mbstring pdo pdo_mysql
RUN pecl install xdebug 
RUN docker-php-ext-enable xdebug
#RUN chown -R www-data:www-data /var/www/html
#RUN openssl req -x509 -new -out /etc/ssl/certs/ssl-cert-simple-api.crt -config /etc/ssl/certs/certificate.conf
#RUN a2ensite simple-api.conf
#RUN a2ensite simple-api-ssl.conf
#RUN a2enmod rewrite
#RUN a2enmod ssl