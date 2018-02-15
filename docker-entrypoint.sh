#!/bin/bash

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "puppet:x:$(id -u):0:Puppet user:/opt/puppetlabs/server/data/puppetserver:/bin/bash" >> /etc/passwd
    echo "puppet:x:$(id -u):puppet" >> /etc/group
  fi
fi

#exec /opt/puppetlabs/bin/puppetserver "$@"
exec sleep 3600
