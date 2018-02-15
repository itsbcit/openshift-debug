FROM ubuntu:16.04
MAINTAINER Jesse Weisner "jesse@weisner.ca"

ENV DUMB_INIT_VERSION="1.2.0" UBUNTU_CODENAME="xenial"

RUN apt-get update && \
    apt-get install -y wget=1.17.1-1ubuntu1 && \
    wget https://github.com/Yelp/dumb-init/releases/download/v"$DUMB_INIT_VERSION"/dumb-init_"$DUMB_INIT_VERSION"_amd64.deb && \
    dpkg -i dumb-init_"$DUMB_INIT_VERSION"_amd64.deb


COPY docker-entrypoint.sh /
RUN chmod 555 /docker-entrypoint.sh

RUN chmod 664 /etc/passwd /etc/group

ENTRYPOINT ["dumb-init", "/docker-entrypoint.sh"]
CMD ["foreground" ]

COPY Dockerfile /

RUN mkdir /cache /data && \
    chown 0:0 /cache /data && \
    chmod 775 /cache /data

VOLUME /data
VOLUME /cache
