FROM caddy:builder@sha256:e248451391b9a9383b5384856a3d3f39777a267958c2f4a84d725ddf537691e7 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@74f004e1c1ab9056288f0baf3cd4b0039d6c77f3

FROM caddy:latest@sha256:2332c4ebc4ae778b9697043d3fa3aaef6879dd17abc03200285af9d315353008

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
