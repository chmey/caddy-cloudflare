FROM caddy:builder@sha256:633ab377cf4c11d70beb0de3943040d404c6b468a1cc4b3fc1029988b15b8b71 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@bfe272c8525b6dd8248fcdddb460fd6accfc4e84

FROM caddy:latest@sha256:2332c4ebc4ae778b9697043d3fa3aaef6879dd17abc03200285af9d315353008

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
