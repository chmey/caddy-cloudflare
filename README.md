# caddy-cloudflare

Caddy with integrated support for Cloudflare DNS-01 ACME verification challenges.

**Please see the official [Caddy Docker Image](https://hub.docker.com/_/caddy) for more detailed deployment instructions.**

## Images

The image is rebuilt every Monday morning at 0300 UTC from currently pinned tags. Commits to this repository also trigger a rebuild.

Updates for pinned versions are created by [renovate](https://github.com/renovatebot/renovate). As the maintainer, I need to manually approve renovate's update PRs.

The images are pushed to the [GitHub Container Registry](https://github.com/chmey/caddy-cloudflare/pkgs/container/caddy-cloudflare).

## Original Project

This project is forked from [Technoguyfication/caddy-cloudflare](https://github.com/Technoguyfication/caddy-cloudflare). Thank you for the original project.

## Requirements
1. A Cloudflare account
2. All domains you want to use with Caddy MUST be on your Cloudflare account, for any domains not through Cloudflare you must fall back to another verification method using the `tls` block [here](https://caddyserver.com/docs/caddyfile/directives/tls).


## Notes

Caddy will use DNS-01 ACME verification to generate certificates for any domains you specify in your Caddyfile. You can also use wildcard domains (e.g. `*.example.com`) in your Caddyfile and certificates will be obtained for them.

## Instructions:

1. Obtain your Cloudflare API token by visiting your Cloudflare dashboard and creating a token with the following permissions:
	- Zone / Zone / Read

	- Zone / DNS / Edit

	The token does not need any more permissions than these for DNS-01 ACME verification.

2. Add this to your Caddyfile (or create one with this):
	```Caddyfile
	{
		acme_dns cloudflare {$CLOUDFLARE_API_TOKEN}
		email   {$ACME_EMAIL}
	}
	```

3. Start your Docker container using the following command (substituting your own token and email address):
	```
	docker run -it --name caddy \
		-p 80:80 \
		-p 443:443 \
		-v caddy_data:/data \
		-v caddy_config:/config \
		-v $PWD/Caddyfile:/etc/caddy/Caddyfile \
		-e ACME_EMAIL=me@example.com \
		-e CLOUDFLARE_API_TOKEN=123457890 \
		-e ACME_AGREE=true \
		ghcr.io/chmey/caddy-cloudflare:latest
	```

	Or for docker-compose:
	```yaml
    version: "3.7"

    services:
    caddy:
      image: ghcr.io/chmey/caddy-cloudflare:latest
      restart: unless-stopped
      environment:
      - ACME_EMAIL="me@example.com"
      - CLOUDFLARE_API_TOKEN=1234567890
      - ACME_AGREE=true
      ports:
      - "80:80"
      - "443:443"
      volumes:
      - caddy_data:/data
      - caddy_config:/config
      - $PWD/Caddyfile:/etc/caddy/Caddyfile

    volumes:
      caddy_data:
      caddy_config:
	```
