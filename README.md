# WebDevOps Dockerfiles

Dockerfiles for various prebuilt docker containers

[![Docker layout](https://static.webdevops.io/docker-layout.small.png)](https://static.webdevops.io/docker-layout.png)

Dockerfile                                         | Description                                                                        | Depends on                                                           |
-------------------------------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
[`bootstrap`](base/README.md)                      | Distribution with ansible and some scripts                                         | official docker files                                                |
[`base`](base/README.md)                           | Base containers for WebDevOps service containers                                   | [`webdevops/bootstrap`](https://hub.docker.com/r/webdevops/bootstrap/) |
[`php`](php/README.md)                             | PHP (cli and fpm) service containers                                               | [`webdevops/base`](https://hub.docker.com/r/webdevops/base/)         |
[`php-apache`](php-apache/README.md)               | PHP (cli and fpm) with Apache service containers                                   | [`webdevops/php`](https://hub.docker.com/r/webdevops/php/)           |
[`php-nginx`](php-nginx/README.md)                 | PHP (cli and fpm) with Nginx service containers                                    | [`webdevops/php`](https://hub.docker.com/r/webdevops/php/)           |
[`hhvm`](hhvm/README.md)                           | HHVM (cli and fcgi) service containers                                             | [`webdevops/base`](https://hub.docker.com/r/webdevops/base/)         |
[`hhvm-apache`](hhvm-apache/README.md)             | HHVM (cli and fcgi) with Apache service containers                                 | [`webdevops/hhvm`](https://hub.docker.com/r/webdevops/hhvm/)         |
[`hhvm-nginx`](hhvm-nginx/README.md)               | HHVM (cli and fcgi) with Nginx service containers                                  | [`webdevops/hhvm`](https://hub.docker.com/r/webdevops/hhvm/)         |
[`vsftp`](vsftp/README.md)                         | VSFTP (ftp service) service container                                              | [`webdevops/base:latest`](https://hub.docker.com/r/webdevops/base/)  |
[`storage`](storage/README.md)                     | Storage (noop) container                                                           | [`webdevops/base:latest`](https://hub.docker.com/r/webdevops/base/)  |
[`ssh`](ssh/README.md)                             | SSH service container                                                              | [`webdevops/base:latest`](https://hub.docker.com/r/webdevops/base/)  |
[`postfix`](postfix/README.md)                     | Postfix service container                                                          | [`webdevops/base:latest`](https://hub.docker.com/r/webdevops/base/)  |
[`mail-sandbox`](mail-sandbox/README.md)           | Mail catcher service container (catches all mails via SMTP and are accessable via IMAP) | [`webdevops/postfix:latest`](https://hub.docker.com/r/webdevops/postfix/)  |
[`samson-deployment`](samson-deployment/README.md) | [Samson](https://github.com/webdevops/samson-deployment) based deployment service  | [`zendesk/samson`](https://hub.docker.com/r/zendesk/samson/)         |

# Building

Lokal building of containers can be done with `make` and `Makefile`:

Command                     | Description                                                                       
--------------------------- | ----------------------------------------------------------------------------------
`make all`                  | Build all containers *fast mode* (parallel building, `FAST=1`)
`FAST=0 make all`           | Build all containers *slow mode* (serial building)
`DEBUG=1 make all`          | Show log of build process even if process is successfull
`FORCE=1 make all`          | Force container build (`docker build --no-cache ...`)
<br>                        |
`make provision`            | Deploy all configuration files from [_provisioning/](_provisioning/README.md)
`make dist-update`          | Update local distrubtion images (CentOS, Debian, Ubuntu)
<br>                        |
`make test`                 | Run testsuite (use currently available docker images on your docker host)
`make test-hub-images`      | Run testsuite but pull newest docker images from docker hub first
<br>                        |
`make push`                 | Run tests and rebuild them (use cache) and push them to docker hub
`make publish`              | Run `dist-update`, `all` with FORCE and `push`
<br>                        |
`make base`                 | Build all base containers
`make service`              | Build all service containers
`make php`                  | Build all php containers
`make hhvm`                 | Build all hhvm containers
`make nginx`                | Build all nginx containers
`make apache`               | Build all apache containers
`make webdevops/php-nginx`  | Build specific containers (as example)

# Provisioning

All `base` inherited containers provides an modular provisioning available as simple shell scripts and ansible roles.
See [base/README.md](base/README.md) for more informations.

The configuration and provisioning files are build from [_provisioning/](_provisioning/README.md) to get a consistent
configuraiton for all containers. This also should reduce copy&paste errors because the configuration will be deployed
automatically into containers on build process.

# Images

Image                               | Info                                                                       
----------------------------------- | ----------------------------------------------------------------------------------
<strong>Bootstrap container<strong> |
webdevops/bootstrap:latest          | [![](https://badge.imagelayers.io/webdevops/bootstrap:latest.svg)](https://imagelayers.io/?images=webdevops/bootstrap:latest 'Get your own badge on imagelayers.io')
webdevops/bootstrap:ubuntu-12.04    | [![](https://badge.imagelayers.io/webdevops/bootstrap:ubuntu-12.04.svg)](https://imagelayers.io/?images=webdevops/bootstrap:ubuntu-12.04 'Get your own badge on imagelayers.io')
webdevops/bootstrap:ubuntu-14.04    | [![](https://badge.imagelayers.io/webdevops/bootstrap:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/bootstrap:ubuntu-14.04 'Get your own badge on imagelayers.io')
webdevops/bootstrap:ubuntu-15.04    | [![](https://badge.imagelayers.io/webdevops/bootstrap:ubuntu-15.04.svg)](https://imagelayers.io/?images=webdevops/bootstrap:ubuntu-15.04 'Get your own badge on imagelayers.io')
webdevops/bootstrap:ubuntu-15.10    | [![](https://badge.imagelayers.io/webdevops/bootstrap:ubuntu-15.10.svg)](https://imagelayers.io/?images=webdevops/bootstrap:ubuntu-15.14 'Get your own badge on imagelayers.io')
webdevops/bootstrap:centos-7        | [![](https://badge.imagelayers.io/webdevops/bootstrap:centos-7.svg)](https://imagelayers.io/?images=webdevops/bootstrap:centos-7 'Get your own badge on imagelayers.io')
webdevops/bootstrap:debian-8        | [![](https://badge.imagelayers.io/webdevops/bootstrap:debian-8.svg)](https://imagelayers.io/?images=webdevops/bootstrap:debian-8 'Get your own badge on imagelayers.io')
<br>                                |
<strong>Base container<strong>      |
webdevops/base:latest               | [![](https://badge.imagelayers.io/webdevops/base:latest.svg)](https://imagelayers.io/?images=webdevops/base:latest 'Get your own badge on imagelayers.io')
webdevops/base:ubuntu-12.04         | [![](https://badge.imagelayers.io/webdevops/base:ubuntu-12.04.svg)](https://imagelayers.io/?images=webdevops/base:ubuntu-12.04 'Get your own badge on imagelayers.io')
webdevops/base:ubuntu-14.04         | [![](https://badge.imagelayers.io/webdevops/base:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/base:ubuntu-14.04 'Get your own badge on imagelayers.io')
webdevops/base:ubuntu-15.04         | [![](https://badge.imagelayers.io/webdevops/base:ubuntu-15.04.svg)](https://imagelayers.io/?images=webdevops/base:ubuntu-15.04 'Get your own badge on imagelayers.io')
webdevops/base:ubuntu-15.10         | [![](https://badge.imagelayers.io/webdevops/base:ubuntu-15.10.svg)](https://imagelayers.io/?images=webdevops/base:ubuntu-15.14 'Get your own badge on imagelayers.io')
webdevops/base:centos-7             | [![](https://badge.imagelayers.io/webdevops/base:centos-7.svg)](https://imagelayers.io/?images=webdevops/base:centos-7 'Get your own badge on imagelayers.io')
webdevops/base:debian-8             | [![](https://badge.imagelayers.io/webdevops/base:debian-8.svg)](https://imagelayers.io/?images=webdevops/base:debian-8 'Get your own badge on imagelayers.io')
<br>                                |
<strong>PHP container<strong>       |
webdevops/php:latest                | [![](https://badge.imagelayers.io/webdevops/php:latest.svg)](https://imagelayers.io/?images=webdevops/php:latest 'Get your own badge on imagelayers.io')
webdevops/php:ubuntu-12.04          | [![](https://badge.imagelayers.io/webdevops/php:ubuntu-12.04.svg)](https://imagelayers.io/?images=webdevops/php:ubuntu-12.04 'Get your own badge on imagelayers.io')
webdevops/php:ubuntu-14.04          | [![](https://badge.imagelayers.io/webdevops/php:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/php:ubuntu-14.04 'Get your own badge on imagelayers.io')
webdevops/php:ubuntu-15.04          | [![](https://badge.imagelayers.io/webdevops/php:ubuntu-15.04.svg)](https://imagelayers.io/?images=webdevops/php:ubuntu-15.04 'Get your own badge on imagelayers.io')
webdevops/php:ubuntu-15.10          | [![](https://badge.imagelayers.io/webdevops/php:ubuntu-15.10.svg)](https://imagelayers.io/?images=webdevops/php:ubuntu-15.14 'Get your own badge on imagelayers.io')
webdevops/php:centos-7              | [![](https://badge.imagelayers.io/webdevops/php:centos-7.svg)](https://imagelayers.io/?images=webdevops/php:centos-7 'Get your own badge on imagelayers.io')
webdevops/php:debian-8-php7         | [![](https://badge.imagelayers.io/webdevops/php:debian-8-php7.svg)](https://imagelayers.io/?images=webdevops/php:debian-8-php7 'Get your own badge on imagelayers.io')
webdevops/php:debian-8              | [![](https://badge.imagelayers.io/webdevops/php:debian-8.svg)](https://imagelayers.io/?images=webdevops/php:debian-8 'Get your own badge on imagelayers.io')
webdevops/php:debian-7              | [![](https://badge.imagelayers.io/webdevops/php:debian-7.svg)](https://imagelayers.io/?images=webdevops/php:debian-7 'Get your own badge on imagelayers.io')
<br>                                |
<strong>Apache HTTPD with PHP container<strong>|
webdevops/php-apache:latest         | [![](https://badge.imagelayers.io/webdevops/php-apache:latest.svg)](https://imagelayers.io/?images=webdevops/php-apache:latest 'Get your own badge on imagelayers.io')
webdevops/php-apache:ubuntu-14.04   | [![](https://badge.imagelayers.io/webdevops/php-apache:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/php-apache:ubuntu-14.04 'Get your own badge on imagelayers.io')
webdevops/php-apache:ubuntu-15.04   | [![](https://badge.imagelayers.io/webdevops/php-apache:ubuntu-15.04.svg)](https://imagelayers.io/?images=webdevops/php-apache:ubuntu-15.04 'Get your own badge on imagelayers.io')
webdevops/php-apache:ubuntu-15.10   | [![](https://badge.imagelayers.io/webdevops/php-apache:ubuntu-15.10.svg)](https://imagelayers.io/?images=webdevops/php-apache:ubuntu-15.14 'Get your own badge on imagelayers.io')
webdevops/php-apache:centos-7       | [![](https://badge.imagelayers.io/webdevops/php-apache:centos-7.svg)](https://imagelayers.io/?images=webdevops/php-apache:centos-7 'Get your own badge on imagelayers.io')
webdevops/php-apache:debian-8-php7  | [![](https://badge.imagelayers.io/webdevops/php-apache:debian-8-php7.svg)](https://imagelayers.io/?images=webdevops/php-apache:debian-8-php7 'Get your own badge on imagelayers.io')
webdevops/php-apache:debian-8       | [![](https://badge.imagelayers.io/webdevops/php-apache:debian-8.svg)](https://imagelayers.io/?images=webdevops/php-apache:debian-8 'Get your own badge on imagelayers.io')
webdevops/php-apache:debian-7       | [![](https://badge.imagelayers.io/webdevops/php-apache:debian-7.svg)](https://imagelayers.io/?images=webdevops/php-apache:debian-7 'Get your own badge on imagelayers.io')
<br>                                |
<strong>NGINX with PHP container<strong>|
webdevops/php-nginx:latest          | [![](https://badge.imagelayers.io/webdevops/php-nginx:latest.svg)](https://imagelayers.io/?images=webdevops/php-nginx:latest 'Get your own badge on imagelayers.io')
webdevops/php-nginx:ubuntu-12.04    | [![](https://badge.imagelayers.io/webdevops/php-nginx:ubuntu-12.04.svg)](https://imagelayers.io/?images=webdevops/php-nginx:ubuntu-12.04 'Get your own badge on imagelayers.io')
webdevops/php-nginx:ubuntu-14.04    | [![](https://badge.imagelayers.io/webdevops/php-nginx:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/php-nginx:ubuntu-14.04 'Get your own badge on imagelayers.io')
webdevops/php-nginx:ubuntu-15.04    | [![](https://badge.imagelayers.io/webdevops/php-nginx:ubuntu-15.04.svg)](https://imagelayers.io/?images=webdevops/php-nginx:ubuntu-15.04 'Get your own badge on imagelayers.io')
webdevops/php-nginx:ubuntu-15.10    | [![](https://badge.imagelayers.io/webdevops/php-nginx:ubuntu-15.10.svg)](https://imagelayers.io/?images=webdevops/php-nginx:ubuntu-15.14 'Get your own badge on imagelayers.io')
webdevops/php-nginx:centos-7        | [![](https://badge.imagelayers.io/webdevops/php-nginx:centos-7.svg)](https://imagelayers.io/?images=webdevops/php-nginx:centos-7 'Get your own badge on imagelayers.io')
webdevops/php-nginx:debian-8-php7   | [![](https://badge.imagelayers.io/webdevops/php-nginx:debian-8-php7.svg)](https://imagelayers.io/?images=webdevops/php-nginx:debian-8-php7 'Get your own badge on imagelayers.io')
webdevops/php-nginx:debian-8        | [![](https://badge.imagelayers.io/webdevops/php-nginx:debian-8.svg)](https://imagelayers.io/?images=webdevops/php-nginx:debian-8 'Get your own badge on imagelayers.io')
webdevops/php-nginx:debian-7        | [![](https://badge.imagelayers.io/webdevops/php-nginx:debian-7.svg)](https://imagelayers.io/?images=webdevops/php-nginx:debian-7 'Get your own badge on imagelayers.io')
<br>                                |
<strong>Apache HTTPD container<strong>|
webdevops/apache:latest             | [![](https://badge.imagelayers.io/webdevops/apache:latest.svg)](https://imagelayers.io/?images=webdevops/apache:latest 'Get your own badge on imagelayers.io')
webdevops/apache:ubuntu-12.04       | [![](https://badge.imagelayers.io/webdevops/apache:ubuntu-12.04.svg)](https://imagelayers.io/?images=webdevops/apache:ubuntu-12.04 'Get your own badge on imagelayers.io')
webdevops/apache:ubuntu-14.04       | [![](https://badge.imagelayers.io/webdevops/apache:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/apache:ubuntu-14.04 'Get your own badge on imagelayers.io')
webdevops/apache:ubuntu-15.04       | [![](https://badge.imagelayers.io/webdevops/apache:ubuntu-15.04.svg)](https://imagelayers.io/?images=webdevops/apache:ubuntu-15.04 'Get your own badge on imagelayers.io')
webdevops/apache:ubuntu-15.10       | [![](https://badge.imagelayers.io/webdevops/apache:ubuntu-15.10.svg)](https://imagelayers.io/?images=webdevops/apache:ubuntu-15.14 'Get your own badge on imagelayers.io')
webdevops/apache:centos-7           | [![](https://badge.imagelayers.io/webdevops/apache:centos-7.svg)](https://imagelayers.io/?images=webdevops/apache:centos-7 'Get your own badge on imagelayers.io')
webdevops/apache:debian-8           | [![](https://badge.imagelayers.io/webdevops/apache:debian-8.svg)](https://imagelayers.io/?images=webdevops/apache:debian-8 'Get your own badge on imagelayers.io')
webdevops/apache:debian-7           | [![](https://badge.imagelayers.io/webdevops/apache:debian-7.svg)](https://imagelayers.io/?images=webdevops/apache:debian-7 'Get your own badge on imagelayers.io')
<br>                                |
<strong>Nginx container<strong>     |
webdevops/nginx:latest              | [![](https://badge.imagelayers.io/webdevops/nginx:latest.svg)](https://imagelayers.io/?images=webdevops/nginx:latest 'Get your own badge on imagelayers.io')
webdevops/nginx:ubuntu-12.04        | [![](https://badge.imagelayers.io/webdevops/nginx:ubuntu-12.04.svg)](https://imagelayers.io/?images=webdevops/nginx:ubuntu-12.04 'Get your own badge on imagelayers.io')
webdevops/nginx:ubuntu-14.04        | [![](https://badge.imagelayers.io/webdevops/nginx:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/nginx:ubuntu-14.04 'Get your own badge on imagelayers.io')
webdevops/nginx:ubuntu-15.04        | [![](https://badge.imagelayers.io/webdevops/nginx:ubuntu-15.04.svg)](https://imagelayers.io/?images=webdevops/nginx:ubuntu-15.04 'Get your own badge on imagelayers.io')
webdevops/nginx:ubuntu-15.10        | [![](https://badge.imagelayers.io/webdevops/nginx:ubuntu-15.10.svg)](https://imagelayers.io/?images=webdevops/nginx:ubuntu-15.14 'Get your own badge on imagelayers.io')
webdevops/nginx:centos-7            | [![](https://badge.imagelayers.io/webdevops/nginx:centos-7.svg)](https://imagelayers.io/?images=webdevops/nginx:centos-7 'Get your own badge on imagelayers.io')
webdevops/nginx:debian-8            | [![](https://badge.imagelayers.io/webdevops/nginx:debian-8.svg)](https://imagelayers.io/?images=webdevops/nginx:debian-8 'Get your own badge on imagelayers.io')
webdevops/nginx:debian-7            | [![](https://badge.imagelayers.io/webdevops/nginx:debian-7.svg)](https://imagelayers.io/?images=webdevops/nginx:debian-7 'Get your own badge on imagelayers.io')
<br>                                |
<strong>HHVM container<strong>      |
webdevops/hhvm:latest               | [![](https://badge.imagelayers.io/webdevops/hhvm:latest.svg)](https://imagelayers.io/?images=webdevops/hhvm:latest 'Get your own badge on imagelayers.io')
webdevops/hhvm:ubuntu-14.04         | [![](https://badge.imagelayers.io/webdevops/hhvm:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/hhvm:ubuntu-14.04 'Get your own badge on imagelayers.io')
<br>                                |
<strong>Apache HTTPD with HHVM container<strong>|
webdevops/hhvm-apache:latest        | [![](https://badge.imagelayers.io/webdevops/hhvm-apache:latest.svg)](https://imagelayers.io/?images=webdevops/hhvm-apache:latest 'Get your own badge on imagelayers.io')
webdevops/hhvm-apache:ubuntu-14.04  | [![](https://badge.imagelayers.io/webdevops/hhvm-apache:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/hhvm-apache:ubuntu-14.04 'Get your own badge on imagelayers.io')
<br>                                |
<strong>NGINX with PHP container<strong>|
webdevops/hhvm-nginx:latest         | [![](https://badge.imagelayers.io/webdevops/hhvm-nginx:latest.svg)](https://imagelayers.io/?images=webdevops/hhvm-nginx:latest 'Get your own badge on imagelayers.io')
webdevops/hhvm-nginx:ubuntu-14.04   | [![](https://badge.imagelayers.io/webdevops/hhvm-nginx:ubuntu-14.04.svg)](https://imagelayers.io/?images=webdevops/hhvm-nginx:ubuntu-14.04 'Get your own badge on imagelayers.io')
<br>                                |
<strong>Service container<strong>   |
webdevops/samson-deployment:latest  | [![](https://badge.imagelayers.io/webdevops/samson-deployment:latest.svg)](https://imagelayers.io/?images=webdevops/samson-deployment:latest 'Get your own badge on imagelayers.io')
webdevops/ssh:latest                | [![](https://badge.imagelayers.io/webdevops/ssh:latest.svg)](https://imagelayers.io/?images=webdevops/ssh:latest 'Get your own badge on imagelayers.io')
webdevops/vsftp:latest              | [![](https://badge.imagelayers.io/webdevops/vsftp:latest.svg)](https://imagelayers.io/?images=webdevops/vsftp:latest 'Get your own badge on imagelayers.io')
<br>                                |
<strong>Misc container<strong>      |
webdevops/storage:latest            | [![](https://badge.imagelayers.io/webdevops/storage:latest.svg)](https://imagelayers.io/?images=webdevops/storage:latest 'Get your own badge on imagelayers.io')
