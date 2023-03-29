FROM debian:stable

RUN apt update && \
    apt -y upgrade && \
    apt -y install libc6 libc6-dev lib32z1 lib32stdc++6 software-properties-common curl apt-transport-https git zip unzip curl jq toilet toilet-fonts coreutils procps \
        python3.9 ffmpeg wget ca-certificates python3-pip

RUN echo 'deb http://http.us.debian.org/debian/ testing non-free contrib main' | tee -a /etc/apt/sources.list && \
    apt-get -y install lsb-release && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt update && \
    apt -y install php7.4 php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli \
        php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl

RUN adduser --disabled-password --home /home/container container

WORKDIR /home/container

ENV HOME=/home/container

ENV USER=container

USER container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
