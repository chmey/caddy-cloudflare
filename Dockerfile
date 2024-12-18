FROM caddy:2.8.4-builder@sha256:2408adf1a3ceaf1df7e004686860186e3f9f44923ce7b2d96289883fceb045a1 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@8789126791ed250b532e1d7d512256737625e6e0

FROM caddy:2.8.4@sha256:07417b42b03b8929ec80240d1a83e27a9c1346ddbff65988608fd1757269c1eb

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
