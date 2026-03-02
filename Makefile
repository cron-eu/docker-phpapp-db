
PLATFORMS=linux/arm64/v8,linux/amd64

# MariaDB, see https://endoflife.date/mariadb
# we only build "LTS" versions:
MARIADB_RELEASE=11.8
MARIADB_RELEASE_LEGACY=10.11

# MySQL:
MYSQL_VERSION=8.4

#BUILDX_OPTIONS=--push
DOCKER_CACHE=--cache-from "type=local,src=.buildx-cache" --cache-to "type=local,dest=.buildx-cache"

build-mariadb:
	docker buildx build $(DOCKER_CACHE) $(BUILDX_OPTIONS) \
		--platform $(PLATFORMS) \
		-f Dockerfile.mariadb \
		--build-arg MARIADB_RELEASE=$(MARIADB_RELEASE) --tag croneu/phpapp-db:mariadb-$(MARIADB_RELEASE) .

build-mariadb-legacy:
	docker buildx build $(DOCKER_CACHE) $(BUILDX_OPTIONS) \
		--platform $(PLATFORMS) \
		-f Dockerfile.mariadb \
		--build-arg MARIADB_RELEASE=$(MARIADB_RELEASE_LEGACY) --tag croneu/phpapp-db:mariadb-$(MARIADB_RELEASE_LEGACY) .

build-mysql:
	docker buildx build $(DOCKER_CACHE) $(BUILDX_OPTIONS) \
		--platform $(PLATFORMS) \
		-f Dockerfile.mysql \
		--build-arg MYSQL_VERSION=$(MYSQL_VERSION) --tag croneu/phpapp-db:mysql-$(MYSQL_VERSION) .

build: build-mysql build-mariadb build-mariadb-legacy
