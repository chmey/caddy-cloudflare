FROM caddy:2.8.4-builder@sha256:69ed2cf83081d2543f490975df1c52e09c0e4776b54d26f049855df45d2b10ae AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@8789126791ed250b532e1d7d512256737625e6e0

FROM caddy:2.8.4@sha256:8ebad2171ccba7c5cb39cebb1c6eec8db77d004c66d9159f5f6dd5916053cd07

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
