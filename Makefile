
PLATFORMS=linux/arm64/v8,linux/amd64

# Defaults:
MARIADB_VERSION=10.7

#BUILDX_OPTIONS=--push
DOCKER_CACHE=--cache-from "type=local,src=.buildx-cache" --cache-to "type=local,dest=.buildx-cache"

build:
	docker buildx build $(DOCKER_CACHE) $(BUILDX_OPTIONS) \
		--platform $(PLATFORMS) \
		--build-arg MARIADB_VERSION=$(MARIADB_VERSION) --tag croneu/phpapp-db:mariadb-$(MARIADB_VERSION) .
