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
ENV FALLBACK="@fastcgi" \
    GZIP_TYPES="application/ecmascript application/javascript application/json application/xhtml+xml application/xml text/css text/ecmascript text/javascript text/plain text/xml" \
    MAX_REQUEST_SIZE="16M" \
    ROOT="/app/public" \
    TIMEOUT=600

# Set FastCGI environment variables.
ENV FCGI_SERVERS="127.0.0.1:9000" \
    FCGI_ROOT="${ROOT}"

WORKDIR "/app"
ENTRYPOINT ["/docker-entrypoint.sh"]
