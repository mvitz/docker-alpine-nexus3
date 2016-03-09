FROM frolvlad/alpine-oraclejdk8:cleaned

MAINTAINER Michael Vitz <michael.vitz@innoq.com>

ENV NEXUS_VERSION=3.0.0-m7 \
    NEXUS_HOME=/home/nexus \
    NEXUS_USER=nexus

COPY nexus-*-unix.tar.gz.* /tmp/

RUN apk add --no-cache --virtual=build-dependencies \
      ca-certificates \
      tar \
      wget && \
    adduser -s /bin/false -D -H "${NEXUS_USER}" && \
    cd /tmp && \
    wget \
      "https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz" && \
    echo "$(cat nexus-${NEXUS_VERSION}-unix.tar.gz.md5)  nexus-${NEXUS_VERSION}-unix.tar.gz" \
      | md5sum -c - && \
    echo "$(cat nexus-${NEXUS_VERSION}-unix.tar.gz.sha1)  nexus-${NEXUS_VERSION}-unix.tar.gz" \
      | sha1sum -c - && \
    mkdir -p "${NEXUS_HOME}" && \
    tar xvf "nexus-${NEXUS_VERSION}-unix.tar.gz" -C "${NEXUS_HOME}" --strip-components=1 && \
    chown -R "${NEXUS_USER}":"${NEXUS_USER}" "${NEXUS_HOME}" && \
    apk del build-dependencies && \
    rm -rf /tmp/*

EXPOSE 8081

USER "${NEXUS_USER}"
WORKDIR "${NEXUS_HOME}"
ENTRYPOINT ["./bin/nexus"]
CMD ["run"]

