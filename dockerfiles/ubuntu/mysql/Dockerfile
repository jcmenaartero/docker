FROM jucamear/ubu-base:latest
COPY ./start-mysql.sh /root
COPY ./mysql.exp /root
RUN chmod 755 /root/mysql.exp
RUN dos2unix /root/start-mysql.sh
RUN chmod 755 /root/start-mysql.sh

RUN apt-get update && apt-get install -y mysql-server

EXPOSE 3306

ENTRYPOINT [ "/root/start-mysql.sh" ]