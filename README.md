Docker Fluffos
==============

### build compile image

```bash
docker build -t lostsnow/fluffos-build ./build
```

### compile driver

```bash
docker run --rm -v /opt/projects/mud:/opt/projects lostsnow/fluffos-build
```

### build mudlib image

```bash
docker build -t lostsnow/fluffos .
``` 

### run mudlib

```bash
# https://github.com/mudchina/es2-utf8
mkdir -p /opt/projects/mud/es2-utf8/log
docker run --name es2 \
    -p 4000:4000 \
    -v /opt/projects/mud:/opt/projects \
    lostsnow/fluffos /opt/projects/docker-fluffos/example/config.ES2
```