FROM caddy:2.7.5-builder@sha256:69aa31f08c840c4f9b8a4720ea42bb66c30f0efff6d7a14325d82b95028b12b3 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@737bf003fe8af81814013a01e981dc8faea44c07

FROM caddy:2.7.5@sha256:325f81ca0328db0737503a53f43717fce79ea0c574e83f8e586c8d350cadf34b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
