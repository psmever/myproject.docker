#!/bin/bash


current_time=$(date "+%Y-%m-%d")

log_file_name=log-$current_time.php

docker-compose exec myproject.web tail -F /var/www/myproject/service/application/logs/$log_file_name