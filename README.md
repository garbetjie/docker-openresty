OpenResty Proxy
===============

A minimal-configuration OpenResty Docker image that makes it easy to have a FastCGI (and/or static file) proxy server
running as quickly as possible. This Docker image makes it trivial to start up a configurable OpenResty proxy server
that is able to serve requests to a FastCGI server.

## Configuration

| Name             | Default          | Description                                                                                                   |
|------------------|------------------|---------------------------------------------------------------------------------------------------------------|
| FALLBACK         | "@fastcgi"       | The fallback location to use if `try_files` fails.                                                            |
| MAX_REQUEST_SIZE | "16M"            | The maximum request size that is allowed.                                                                     |
| ROOT             | "/app/public"    | The document root of the server.                                                                              |
| TIMEOUT          | 600              | The maximum length of time a request can be running for (sets the `fastcgi_read_timeout` property).           |
| FCGI_SERVERS     | "127.0.0.1:9000" | A comma separated list of `ip:port` pairs that will be used to create the upstream proxy for FastCGI servers. |
| FCGI_ROOT        | "${ROOT}"        | The document root for FastCGI servers (can be different to `$ROOT`).                                          |

### Adding custom configuration.

    TODO

### Adding custom upstreams

    TODO

## Changelog

* **2019-11-07**
    * Add README.
    
