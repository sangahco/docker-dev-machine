#!/bin/bash
set -e

if [ $# -eq 0 ]; then
# if no arguments are supplied start apache
    exec /usr/sbin/apache2ctl -DFOREGROUND
fi

exec "$@"