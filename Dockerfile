FROM caddy:builder@sha256:8fa8a41d7e0d498b6b70a5fca05bdb9e3deb00312a830610d2efd6d83fb2b442 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@a9d3ae2690a1d232bc9f8fc8b15bd4e0a6960eec

FROM caddy:latest@sha256:ef6ed6e22b469efd5051e1c4cee221d3a0ebebea14bbb5898c8fb4dc70d12d12

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
