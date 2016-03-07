# docker-alpine-nexus3

This repository contains a [Docker] image for using [Sonatype Nexus][] 3 on
[Alpine Linux][].

[Alpine Linux]: https://www.alpinelinux.org
[Docker]: https://www.docker.com
[Sonatype Nexus]: http://www.sonatype.org/nexus/


## Run

You can run this container by invoking `./run.sh` or calling docker by yourself:

```
docker run -d -p 8081:8081 innoq/docker-alpine-nexus3
```


## TODO

* Configure Nexus to use HTTPS
* Use Docker-Volumes for work and configuration directory


## License

Copyright © 2016 innoQ Deutschland GmbH. Published under the Apache 2.0 license.

