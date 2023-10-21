FROM caddy:2.7.5-builder@sha256:5a9f2d9bca14ca1afb02e140b38e6b21afd3ca2d29985511befb8a8fc22a8fa2 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@737bf003fe8af81814013a01e981dc8faea44c07

FROM caddy:2.7.5@sha256:325f81ca0328db0737503a53f43717fce79ea0c574e83f8e586c8d350cadf34b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
