FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install vim

RUN apt-get -y install php-mysql
RUN apt-get -y install php-mbstring php-fpm
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server

#download phpMyAdmin
WORKDIR /var/www/ft_server
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages phpMyAdmin
#generate key
#RUN openssl genrsa -out rootCA.key 2048
#generate sertificate
#RUN openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem

#nginx conf
WORKDIR /etc/nginx/sites-available/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN rm /etc/nginx/sites-enabled/default


RUN openssl req -newkey rsa:2048 \
	-x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/example.crt \
	-keyout /etc/ssl/private/example.key\
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole/OU=21/CN=localhost"



#download tar wordpress
WORKDIR /var/www/ft_server
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz

#WORKDIR /var/www/ft_server/welcome_nginx/
#RUN ln -s /var/www/html/index.nginx-debian.html /var/www/ft_server/welcome_nginx/index.html 

COPY ./srcs/wp-config.php /var/www/ft_server/wordpress/

COPY ./srcs/start.sh ../
CMD sh ../start.sh

EXPOSE 80 443
