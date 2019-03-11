FROM bcit/alpine:latest
MAINTAINER Jesse Weisner "jesse@weisner.ca"

RUN apk add --no-cache \
        perl \
        rsync \
        vim \
        zip

CMD ["init-loop"]
