# myproject.dev

# docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# docker kill $(docker ps -q)
# docker rm $(docker ps -a -q)
# docker rmi $(docker images -q)

# docker-compose build --force-rm
# docker-compose up
# docker-compose up -d
# docker-compose down
# docker-compose exec myproject.web /etc/init.d/sendmail start

# docker-compose exec myproject.web tail -F /var/log/apache2/error.log
# docker-compose exec myproject.db tail -F /var/log/mysql/error.log
# docker-compose exec myproject.web tail -F /var/log/xdebug.log


# sh ci_day_logs.sh
# sh db_error_log.sh
# sh web_error_log.sh
# sh web_xdebug_log.sh


