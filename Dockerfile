# Determine base image.
ARG OPENRESTY_IMAGE="openresty/openresty"
ARG OPENRESTY_TAG="1.15.8.2-alpine"

# Set the source image.
FROM ${OPENREST_IMAGE}:${OPENRESTY_TAG}

# Copy in the configuration files.
COPY fs /

# Set common environment variables.
ENV WEBROOT="/app/public" \
	TIMEOUT=600 \
	MAX_REQUEST_SIZE="16M"

# Set FastCGI environment variables.
ENV FPM_HOST="127.0.0.1" \
	FPM_PORT=9000 \
	FPM_STATUS_ENABLED="true" \
	FPM_STATUS_PATH="/_/status"
	FPM_WEBROOT="${WEBROOT}"

WORKDIR "/app"
ENTRYPOINT ["/usr/local/openresty/nginx/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
