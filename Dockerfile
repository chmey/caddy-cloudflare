FROM caddy:builder@sha256:5d25acee5683b45e637dff3a8799b8ae6ca58f33fdb1c89db14dd0840c318bd1 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:latest@sha256:ef6ed6e22b469efd5051e1c4cee221d3a0ebebea14bbb5898c8fb4dc70d12d12

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
