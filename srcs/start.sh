#!bin/bash

service nginx start
service mysql start
service php7.3-fpm start

mysql -e "CREATE DATABASE wordpress;" -u root --skip-password
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" -u root --skip-password
mysql -e "FLUSH PRIVILEGES;" -u root --skip-password
mysql -e "UPDATE mysql.user SET plugin='' WHERE user='root';" -u root --skip-password

bash
