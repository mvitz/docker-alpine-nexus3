FROM frolvlad/alpine-oraclejdk8:cleaned

MAINTAINER Michael Vitz <michael.vitz@innoq.com>

ENV NEXUS_VERSION=3.0.0-m7

RUN apk add --no-cache --virtual=build-dependencies \
      ca-certificates \
      curl && \
    adduser -s /bin/false -D -H nexus && \
    curl --fail --location \
        "http://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz" \
        | tar xz -C /tmp && \
    mv /tmp/nexus-* /home/nexus && \
    chown -R nexus:nexus /home/nexus && \
    apk del build-dependencies && \
    rm -rf /tmp/*

EXPOSE 8081

USER nexus
WORKDIR /home/nexus
ENTRYPOINT ["/home/nexus/bin/nexus"]
CMD ["run"]

