FROM caddy:builder@sha256:8fa8a41d7e0d498b6b70a5fca05bdb9e3deb00312a830610d2efd6d83fb2b442 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@a9d3ae2690a1d232bc9f8fc8b15bd4e0a6960eec

FROM caddy:latest@sha256:89213bb94f8a60ebf0554ffe4a45c1af65321140246d34a689e641dae233b063

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
