ARG SUITE=stable
ARG FLAVOR_SUFFIX=
FROM debian:${SUITE}${FLAVOR_SUFFIX}

ARG SUITE
ARG FLAVOR_SUFFIX
ARG VERSION
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.source=https://github.com/its-me/image.debian
LABEL org.opencontainers.image.title="debian"
LABEL org.opencontainers.image.description="Minimal debian:${SUITE}${FLAVOR_SUFFIX} image with ca-certificates installed"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.authors="Sergey Kanafyev <sergeykanafyev@gmail.com>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
