FROM caddy:2.7.5-builder@sha256:801ec8f85e0f5ec8569a071d8e9a1e307c7f58d12e2fe3c245e6f3f25353ebda AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@737bf003fe8af81814013a01e981dc8faea44c07

FROM caddy:2.7.5@sha256:9eb928f0a3142d0a38e6d457f7696c08c13e070d49d6499cc5b0afe644ecb281

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
