FROM ubuntu
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG USUARIO
ARG PASSWD

COPY ./packages.txt /root
COPY ./start.sh /root
COPY ./id_rsa.pub /root

RUN apt-get update -y
RUN apt-get install -yq --no-install-recommends $(grep -vE "^\s*#" /root/packages.txt)

RUN chmod 755 /root/start.sh
RUN dos2unix /root/start.sh 

ENTRYPOINT [ "/root/start.sh" ]