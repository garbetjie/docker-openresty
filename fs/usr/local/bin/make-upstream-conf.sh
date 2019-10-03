#!/usr/bin/env sh

conf_file="/usr/local/openresty/nginx/conf/conf.d/upstreams/${1}.conf"
rm -f "$conf_file"

if [ "$2" != "" ]; then
  mkdir -p "$(dirname "$conf_file")"
  IFS=","

  printf 'upstream %s {\n' "$1" > "$conf_file"
  for server in $2; do
    printf '    server %s;\n' "$server" >> "$conf_file"
  done
  printf '}\n' >> "$conf_file"
fi