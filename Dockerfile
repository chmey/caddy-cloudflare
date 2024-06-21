FROM caddy:2.8.4-builder@sha256:1e57c607ff8c377909a1200bf27965a72d745694339d240dc03cb60704a7ca04 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@8789126791ed250b532e1d7d512256737625e6e0

FROM caddy:2.8.4@sha256:05efaa6ec0363f5a3e37489aa60c2aed6707311c9b30c63dee598a5cfd742d97

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
