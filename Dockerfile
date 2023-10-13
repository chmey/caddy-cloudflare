FROM caddy:2.7.5-builder@sha256:ec3e3631cf04dcdd40c8071ad0b96cf1c3e9cfd8d054c43f8467bf0e9fb5972f AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@bfe272c8525b6dd8248fcdddb460fd6accfc4e84

FROM caddy:2.7.5@sha256:a135b689e419e662ab30be6ee511071263e8371b872e2c0a8eaa5f0fd480ed81

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
