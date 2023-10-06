FROM caddy:2.7.4-builder@sha256:89413da724c0a6b7d813a95f3ccacaf31680a5232035dbfe0f75940316c0684a AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@bfe272c8525b6dd8248fcdddb460fd6accfc4e84

FROM caddy:2.7.4@sha256:3d1bf053476f2415b40e728c37e1112ee7551fa154a63d6f62b275c13fea8166

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
