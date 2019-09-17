FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
        unzip \
		libzip-dev \
		libxml2-dev \
		less \
		libsodium-dev -y \
		libpq-dev \
		nginx \
		bash \
	&& docker-php-ext-install \
        sodium \
        mysqli \
        pdo \
        pdo_mysql \
        zip \
        soap

RUN echo 'umask 0000' >> /root/.bashrc

# Nginx configuration
COPY docker/nginx/server.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled
RUN rm /etc/nginx/sites-enabled/default

RUN mkdir -p /opt/service /var/www/.composer /var/www/.config;chown -R www-data:www-data /opt/service /var/www/.composer /var/www/.config

COPY ./init.sh /init.sh
RUN chmod +x /init.sh

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests supervisor
COPY docker/supervisord/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

USER www-data

WORKDIR /opt/service

COPY --chown=www-data:www-data ./ /opt/service
RUN rm -f /opt/service/src/log/*.log
RUN mkdir -p /opt/service/var/cache
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install
RUN php artisan key:generate

USER root

ENTRYPOINT ["/init.sh"]

EXPOSE 9000

CMD ["supervisord"]
