#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=${WP_HOST} --title=inception --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_MAIL} --allow-root
./wp-cli.phar user create ${WP_USER} ${WP_USER_MAIL} --role=author --user_pass=${WP_USER_PASS} --allow-root

php-fpm8.2 -F