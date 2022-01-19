# cron PHP application docker images - Database

## Abstract

Part of the `docker-phpapp` image suite.

See https://github.com/cron-eu/docker-phpapp-php/README.md for a complete explanation.

This is the MySQL database container, with images for **amd64** and **arm64**
(i.e. also run on Apple M1).

## Tags available

* `croneu/phpapp-db:mariadb-10.7`

This is just a pre-configured alternative to the upstream official **MariaDB** image. This
allows us to use it straight on for TYPO3 projects without having to include any further
configuration or do any performance tuning.

We are using MariaDB instead of the official MySQL images, because these are not available
for ARM architecture yet.

## Settings

See upstream: https://hub.docker.com/_/mariadb

Example `docker-compose.yaml`:

```
  mysql:
    image: croneu/phpapp-db:mariadb-10.7
    ports:
      - 13306:3306
    volumes:
      - mysql:/var/lib/mysql
    environment:
      MARIADB_ROOT_PASSWORD: ${DB_PASS}
      MARIADB_DATABASE: ${DB_NAME}
      MARIADB_USER: ${DB_USER}
      MARIADB_PASSWORD: ${DB_PASS}
```

----

## Docker Image Development

Build is triggered automatically via Github Actions.

To create them locally for testing purposes (and load created images to your docker):

```
make build BUILDX_OPTIONS=--load PLATFORMS=linux/amd64
```

## MIT Licence

See the [LICENSE](LICENSE) file.

## Author

Ernesto Baschny, [cron IT GmbH](https://www.cron.eu)