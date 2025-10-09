FROM caddy:2.10.2-builder@sha256:5ffdd1eb7c262d118977dfd8c4a0c34c7781366fbadef3b4daeac459cb30e99e AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@35fb8474f57d7476329f75d63eebafb95a93022f

FROM caddy:2.10.2@sha256:614bbc6da7ec42f3c76077e86f429297047680f9cb420ad0f07a8fe049193d89

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
