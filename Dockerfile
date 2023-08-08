FROM caddy:builder@sha256:f93573a72179f8f660127d9ae09a2a188b9194320f6fc1dbf562ca1bc7b38386 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@a9d3ae2690a1d232bc9f8fc8b15bd4e0a6960eec

FROM caddy:latest@sha256:89213bb94f8a60ebf0554ffe4a45c1af65321140246d34a689e641dae233b063

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
