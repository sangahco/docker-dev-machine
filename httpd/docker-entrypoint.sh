#!/usr/bin/env bash
set -e

APACHE_SSL=${APACHE_SSL:?missing}
APACHE_SSL_KEY=${APACHE_SSL_KEY:-key.pem}
APACHE_SSL_CERT=${APACHE_SSL_CERT:-cert.pem}
APACHE_SSL_CHAIN=${APACHE_SSL_CHAIN:-chain.pem}

echo "Starting Apache HTTP with the following settings:"
echo "- ssl enabled:     ${APACHE_SSL}"
echo "- ssl key file:    ${APACHE_SSL_KEY}"
echo "- ssl cert file:   ${APACHE_SSL_CERT}"
echo "- ssl chain file:  ${APACHE_SSL_CHAIN}"

if [ "$APACHE_SSL" == "1" ]; then
    /usr/sbin/a2enconf ssl.conf
fi

if [ $# -eq 0 ]; then
    # if no arguments are supplied start apache
    exec /usr/sbin/apache2ctl -DFOREGROUND
fi

exec "$@"