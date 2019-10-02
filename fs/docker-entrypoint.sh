#!/bin/sh

# Build up the list of hosts that are allowed to access the FPM status path.
IFS=" "
fpm_status_hosts_formatted=""

export FPM_STATUS_HOSTS_FORMATTED="$fpm_status_hosts_formatted"

# Replace environment variables in nginx configuration file.
IFS=$'\n'
for file in `find /etc/nginx -type f -iname '*.conf'`; do
    envsubst '$FPM_HOST
              $FPM_PORT
              $FPM_STATUS_PATH
              $FPM_STATUS_HOSTS_FORMATTED
              $MAX_REQUEST_SIZE
              $TIMEOUT
              $WEBROOT' < "$file" > "${file}.tmp"

    mv "${file}.tmp" "$file"
done

# Run the nginx server.
exec nginx
