#!/usr/bin/env sh

set -e

# Change into the config directory.
cd /usr/local/openresty/nginx

# Make upstreams.
make-upstream-conf.sh "fastcgi" "$FCGI_SERVERS"

# Replace environment variables in config files.
# shellcheck disable=SC2016
find conf -type f -iname '*.conf' -print0 | xargs -0 -n 1 -I @ sh -c 'envsubst '"'"'$FCGI_ROOT$FALLBACK$MAX_REQUEST_SIZE$TIMEOUT$ROOT'"'"' < "$1" > "${1}.tmp"; mv "${1}.tmp" "$1"' -- @

# Start up the web server.
exec sbin/nginx