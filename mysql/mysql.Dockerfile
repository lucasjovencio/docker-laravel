FROM mysql:latest
RUN ln -snf /usr/share/zoneinfo/Amrerica/Sao_paulo /etc/localtime && echo Amrerica/Sao_paulo > /etc/timezone && chown -R mysql:root /var/lib/mysql/
COPY mysql/mysql.cnf /etc/mysql/conf.d/mysql.cnf
RUN chmod 0444 /etc/mysql/conf.d/mysql.cnf
CMD ["mysqld"]
EXPOSE 3306
