FROM caddy:2.7.6-builder@sha256:884d7220deab28816c2da00020bc5b214967b8c8782ed8a06676f09cfbd88780 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@8789126791ed250b532e1d7d512256737625e6e0

FROM caddy:2.7.6@sha256:b392690ebadd518b3f7289ff5175badd347b58f404a5c7e69fafc63c20a146e8

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
