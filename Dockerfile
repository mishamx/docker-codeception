FROM mishamx/php7:latest

RUN composer require "codeception/codeception" --dev \
    && curl -LsS http://codeception.com/codecept.phar -o /usr/local/bin/codecept \
    && chmod a+x /usr/local/bin/codecept

ADD composer.json ./
ADD composer.lock ./

RUN composer install --no-progress --ignore-platform-reqs --prefer-dist --profile --optimize-autoloader

