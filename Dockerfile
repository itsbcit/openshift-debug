FROM bcit/alpine:3.10
LABEL maintainer="jesse@weisner.ca"
LABEL build_id="1567135465"

RUN apk add --no-cache \
        perl \
        rsync \
        vim \
        zip

CMD ["init-loop"]
