# Determine base tag.
ARG OPENRESTY_TAG="1.15.8.2-alpine"

# Set the source image.
FROM openresty/openresty:${OPENRESTY_TAG}

# Add additional packages.
RUN apk add --no-cache gettext

# Copy in the configuration files.
RUN find /usr/local/openresty/nginx/conf -name '*.default' -delete
COPY fs /

# Set common environment variables.
ENV MAX_REQUEST_SIZE="16M" \
    TIMEOUT=600 \
    FALLBACK="@fastcgi" \
    ROOT="/app/public"

# Set FastCGI environment variables.
ENV FCGI_SERVERS="127.0.0.1:9000" \
    FCGI_ROOT="${ROOT}"

WORKDIR "/app"
ENTRYPOINT ["/docker-entrypoint.sh"]
