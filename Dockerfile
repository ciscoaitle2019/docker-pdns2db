FROM ubuntu:16.04

COPY . /usr/src/pdns2db
WORKDIR /usr/src/pdns2db

RUN apt-get -qq update
RUN apt-get -qq install \
        binutils-dev libldns1 libldns-dev \
        libpcap-dev libdbi-perl libdbd-mysql-perl \
        libdatetime-format-mysql-perl \
        libdate-simple-perl 

RUN rm -r /var/lib/apt/lists/*

#CMD [ "perl", "./pdns2db.pl", "1>/dev/stdout", "2>/dev/stdout"]

RUN chmod 755 /usr/src/pdns2db/docker-entrypoint.sh

ENTRYPOINT ["/usr/src/pdns2db/docker-entrypoint.sh"]
