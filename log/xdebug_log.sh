#!/bin/bash 

docker-compose exec myproject.web tail -F /var/log/xdebug.log
