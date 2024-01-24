FROM caddy:2.7.6-builder@sha256:dd49bcbfc0844da5e0b21f03cb8ca0730827fd755ea56c1a2b0fc84d043c982f AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@7b8ded4723447783f11070f0b5b572b43d7f0d7a

FROM caddy:2.7.6@sha256:30e260d85ca22c9a0e3624ec2f53ec634e57fecd2a1141095cac16d71ab72cfe

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
