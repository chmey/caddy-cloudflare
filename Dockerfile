FROM caddy:builder@sha256:6096e6b9c926b857da0958db3aa0b7d43a22c1711ff101c1263cbefbd9d39643 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@bfe272c8525b6dd8248fcdddb460fd6accfc4e84

FROM caddy:latest@sha256:df239ca80315c8271f9e87a981fb47124831f8b5a7c85970249d2dfd712479a3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
