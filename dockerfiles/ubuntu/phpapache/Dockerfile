FROM jucamear/ubu-base
RUN apt update && apt install -yq --no-install-recommends \
    software-properties-common
#indicamos el timezone
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#instalamos php
#RUN add-apt-repository ppa:ondrej/php 
COPY ./packages.txt /root/packages.txt
WORKDIR /root
RUN apt-get install -yq --no-install-recommends $(grep -vE "^\s*#" packages.txt)