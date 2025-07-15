FROM php:8.2-fpm-alpine

# Instala paquetes del sistema y extensiones de PHP para MySQL
RUN apk add --no-cache \
    bash \
    git \
    curl \
    unzip \
    nodejs \
    npm \
    libpng-dev \
    libzip-dev \
    libxml2-dev \
    oniguruma-dev \
    zlib-dev \
    icu-dev \
    && docker-php-ext-install \
        pdo_mysql \
        mbstring \
        zip \
        xml \
        gd \
        intl \
        bcmath \
        fileinfo

# Instala Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY . .

RUN mkdir -p storage/logs bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

RUN composer install --no-dev --no-interaction --prefer-dist
RUN npm install

RUN npm run build

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
