FROM jucamear/ubu-base:latest

ARG PROYECTO
ARG URL

RUN apt-get update && apt-get install -yq --no-install-recommends \
    software-properties-common

COPY ./packages-php.txt /root
COPY ./start-laravel.sh /root

RUN apt-get install -yq --no-install-recommends $(grep -vE "^\s*#" /root/packages-php.txt)

RUN chmod 755 /root/start-laravel.sh
RUN dos2unix /root/start-laravel.sh 

ENTRYPOINT [ "/root/start-laravel.sh" ]