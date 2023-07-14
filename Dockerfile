FROM caddy:builder@sha256:5d25acee5683b45e637dff3a8799b8ae6ca58f33fdb1c89db14dd0840c318bd1 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@a9d3ae2690a1d232bc9f8fc8b15bd4e0a6960eec

FROM caddy:latest@sha256:60fb54d36b4b56b655fbcea432b0057ecc24f68d3a9ff800c695886be48e368d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
