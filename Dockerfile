FROM php:8.2-apache
RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    libonig-dev \
    libcurl4-gnutls-dev \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd intl mbstring mysqli soap xml xsl zip pdo  fileinfo pdo_mysql \
    && a2enmod rewrite headers \
    && service apache2 restart

COPY ./opencart.zip /var/www/html/
RUN apt-get install -y unzip \
    && unzip /var/www/html/opencart.zip '*/upload/*' -d /var/www/html/ \
    && mv /var/www/html/opencart-*/upload/* /var/www/html/ \
    && rm -rf /var/www/html/opencart* \
    && cp /var/www/html/config-dist.php /var/www/html/config.php \
    && cp /var/www/html/admin/config-dist.php /var/www/html/admin/config.php \
    && chown -R www-data:www-data /var/www/
