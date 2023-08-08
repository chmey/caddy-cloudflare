FROM caddy:builder@sha256:f93573a72179f8f660127d9ae09a2a188b9194320f6fc1dbf562ca1bc7b38386 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@a9d3ae2690a1d232bc9f8fc8b15bd4e0a6960eec

FROM caddy:latest@sha256:60fb54d36b4b56b655fbcea432b0057ecc24f68d3a9ff800c695886be48e368d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
