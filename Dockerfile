FROM caddy:builder@sha256:346be6df74d1e007897980c590c56d1e8cfadf8e4a2d470208768982a6382fd5 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@bfe272c8525b6dd8248fcdddb460fd6accfc4e84

FROM caddy:latest@sha256:b3a7eac3daba82e1d682a7fa3f11b6d0dbe32869cdcc835fd30748021fbe3b9f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
