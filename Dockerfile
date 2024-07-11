FROM caddy:2.8.4-builder@sha256:efb0a066246f690811b6063d74e5ba633f62286ed15f39f6eb3d05c2a870a2fe AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@8789126791ed250b532e1d7d512256737625e6e0

FROM caddy:2.8.4@sha256:d4c3d1d98f070f36d21eff1e7521edb718704a9f906618708b06946b9eb4f448

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
