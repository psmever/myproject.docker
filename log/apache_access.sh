#!/bin/bash
docker-compose exec myproject.web tail -F /var/log/apache2/access.log
