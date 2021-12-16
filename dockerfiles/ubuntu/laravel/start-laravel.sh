#!/bin/bash

bash /root/start.sh

php -r "copy('https://getcomposer.org/installer','/root/composer-setup.php');";
php /root/composer-setup.php --install-dir=/usr/local/bin --filename=composer

cd /var/www/html

composer create-project laravel/laravel api${PROYECTO}

sed -i 's/APP_URL=http:\/\/localhost/APP_URL='${URL}'/' /var/www/html/api${PROYECTO}/.env
sed -i 's/DB_HOST=127.0.0.1/DB_HOST=mysql_db/' /var/www/html/api${PROYECTO}/.env
sed -i 's/DB_PASSWORD=/DB_PASSWORD='${PASSWD}'/' /var/www/html/api${PROYECTO}/.env
sed -i 's/DB_USERNAME=root/DB_USERNAME='${USUARIO}'/' /var/www/html/api${PROYECTO}/.env
#sed -i 's/DB_PORT=3306/DB_PORT=3306/' /var/www/html/api${PROYECTO}/.env
sed -i 's/DB_DATABASE=laravel/DB_DATABASE='${PROYECTO}'/' /var/www/html/api${PROYECTO}/.env

sed -i '172 s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/api'${PROYECTO}'\/public/' /etc/apache2/sites-available/000-default.conf

chown -R www-data:www-data /var/www/html/api${PROYECTO}

cd /etc/apache2/mods-enabled
a2enmod rewrite

/etc/init.d/apache2 start 

tail -f /dev/null
