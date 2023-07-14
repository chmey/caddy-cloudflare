FROM caddy:builder@sha256:8fa8a41d7e0d498b6b70a5fca05bdb9e3deb00312a830610d2efd6d83fb2b442 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@a9d3ae2690a1d232bc9f8fc8b15bd4e0a6960eec

FROM caddy:latest@sha256:60fb54d36b4b56b655fbcea432b0057ecc24f68d3a9ff800c695886be48e368d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
