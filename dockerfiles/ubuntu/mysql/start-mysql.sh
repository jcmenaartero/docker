#!/bin/bash

bash /root/start.sh

sed -i 's/# pid-file/pid-file/' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i 's/# socket/socket/' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i 's/# port/port/' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i 's/# datadir/datadir/' /etc/mysql/mysql.conf.d/mysqld.cnf
#sed -i 's/= 127.0.0.1/= 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

mkdir /var/run/mysql
chown -R mysql:mysql /var/run/mysql

/etc/init.d/mysql start
expect /root/mysql.exp
/etc/init.d/mysql restart

echo "CREATE USER '${USUARIO}'@'%' IDENTIFIED BY '${PASSWD}';" > /root/user.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${USUARIO}'@'%' WITH GRANT OPTION;" >> /root/user.sql
echo "FLUSH PRIVILEGES;" >> /root/user.sql
mysql -u root -p"usuario" < /root/user.sql
#mysql -u root < /root/${PROYECTO}.sql

tail -f /dev/null