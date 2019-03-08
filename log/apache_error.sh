#!/bin/bash 
docker-compose exec myproject.web tail -F /var/log/apache2/error.log
