# About project
This project is intended to provide an introduction to system administration. 
This will let you know the importance of using scripts to automate your tasks.
To do this, you will open Docker technology and use it to set up a complete web server. 

## Services
This server will run several services: 
![Wordpress](https://img.shields.io/badge/-Wordpress-0C1117??style=flat-square&logo=Wordpress)
![phpMyAdmin](https://img.shields.io/badge/-phpMyAdmin-0C1117??style=flat-square&logo=php)
![SQL database](https://img.shields.io/badge/-MariaDB-0C1117??style=flat-square&logo=MariaDB)

### Usage

#### Build image
    docker build -t ft_server .
#### Run image
    docker run -it --rm -p 80:80 -p 443:443 ft_server

# Materials

  * About [Docker]
  * [Docker tutorial](https://docs.docker.com/get-started/)
  * About [Nginx]
  * [SLL Сertificate](https://habr.com/ru/post/352722/)


[Nginx]:(https://nginx.org/ru/docs/beginners_guide.html)
[Docker]:(https://www.docker.com/)
