FROM debian:bullseye

COPY tools/configWP.sh /configWP.sh

RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install wget -y \
 && apt-get install php7.4 php-fpm php-mysql mariadb-client -y

COPY ./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www \
 && cd /var/www \
 && tar -xzf wordpress-6.0.tar.gz \
 && rm wordpress-6.0.tar.gz \
 && chown -R www-data:www-data /var/www/wordpress 
RUN chmod 755 /var/www/ \
 && wget https://wordpress.org/wordpress-6.0.tar.gz \
 && apt-get install curl -y \
 && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp \
 && chmod +x configWP.sh \
 && chmod -R 755 /var/www/wordpress

ENTRYPOINT ["bash", "configWP.sh"]