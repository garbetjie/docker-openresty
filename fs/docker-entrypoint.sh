#!/usr/bin/env sh

set -e

# Change into the config directory.
cd /usr/local/openresty/nginx

# Make upstreams.
make-upstream-conf.sh "fastcgi" "$FCGI_SERVERS"

# Replace environment variables in config files.
# shellcheck disable=SC2016
find conf -type f -iname '*.conf' \
  -exec sh -c 'envsubst '"'"'$FALLBACK
                             $FCGI_ROOT
                             $GZIP_TYPES
                             $MAX_REQUEST_SIZE
                             $ROOT
                             $TIMEOUT'"'"' < "$1" > "${1}.tmp"' _ {} \; \
  -exec sh -c 'mv "${1}.tmp" "$1"' _ {} \;

# Start up the web server.
exec sbin/nginx
