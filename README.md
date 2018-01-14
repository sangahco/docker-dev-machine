## Services Included

**httpd** - Apache HTTP Server

**owncloud** - Owncloud Service

> IMPORTANT
> 
> In order to restore the company owncloud environment with all the users and data, we need to replace the file `config.php`, inside the folder `owncloud`, with the company settings that you can find on Amazon AWS S3 at this link: https://s3.ap-northeast-2.amazonaws.com/sangah-b1/owncloud/config.php
> 
> \* you need to login to access the file

**mysql** - MySql DB

**phpmyadmin** - MySql Admin Web UI

---

## Get It

    $ git clone https://github.com/sangahco/docker-dev-machine.git

## Startup

    $ docker-compose build --pull
    $ docker-compose up -d

## Shutdown

    $ docker-compose down

## Update

    $ git pull
    $ docker-compose build --pull