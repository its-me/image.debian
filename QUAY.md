# Debian Container Images

Debian container images built on the official `slim` variants, published daily, across five Debian suites: `stable`, `testing`, `unstable`, `oldstable`, and `oldoldstable`.

## Images

Each suite produces the same three-tier image stack:

### Base

Minimal `debian:<suite>-slim` image, upgraded (`apt-get upgrade`) and with `ca-certificates` installed. Intended as a foundation for other images.

```
docker pull quay.io/itsme/debian:latest       # stable
docker pull quay.io/itsme/debian:testing
docker pull quay.io/itsme/debian:unstable
docker pull quay.io/itsme/debian:oldstable
docker pull quay.io/itsme/debian:oldoldstable
```

### Python

Extends the base image with `python3` and `python3-pip`. Built for the same platforms as the base image for that suite.

```
docker pull quay.io/itsme/debian:python       # stable
docker pull quay.io/itsme/debian:testing-python
docker pull quay.io/itsme/debian:unstable-python
docker pull quay.io/itsme/debian:oldstable-python
docker pull quay.io/itsme/debian:oldoldstable-python
```

### uv

Extends the Python image with [uv](https://github.com/astral-sh/uv) — built from source on `linux/amd64`, `linux/arm64`, `linux/arm/v7`, and `linux/386`, and installed from the official prebuilt release binary on `linux/ppc64le`, `linux/riscv64`, and `linux/s390x` (where present), since compiling under QEMU emulation is impractically slow (hours, not minutes) on those architectures. `linux/arm/v5` is always excluded — Rust has no ARMv5 target and uv publishes no binary for it either.

```
docker pull quay.io/itsme/debian:uv           # stable
docker pull quay.io/itsme/debian:testing-uv
docker pull quay.io/itsme/debian:unstable-uv
docker pull quay.io/itsme/debian:oldstable-uv
docker pull quay.io/itsme/debian:oldoldstable-uv
```

## Platforms

Each suite builds whatever platforms Docker Hub currently publishes for `debian:<suite>-slim`, resolved from the upstream manifest at build time rather than hardcoded — Debian's per-suite architecture support shifts as its release cycle rolls forward, especially for `oldstable` and `oldoldstable`. The uv image additionally always excludes `linux/arm/v5`, since neither Rust nor uv's release binaries target it.

## Tags

| Tag pattern | Description |
|-------------|-------------|
| `latest` | `stable` base image |
| `YYMMDD` | date-stamped `stable` base image |
| `python` | `stable` Python image |
| `python-YYMMDD` | date-stamped `stable` Python image |
| `uv` | `stable` uv image |
| `uv-YYMMDD` | date-stamped `stable` uv image |
| `uv-<uv version>` | `stable` uv image, stamped with the bundled uv release (e.g. `uv-0.11.32`) |
| `<suite>` | base image for `<suite>` (`testing`, `unstable`, `oldstable`, `oldoldstable`) |
| `<suite>-YYMMDD` | date-stamped base image for `<suite>` |
| `<suite>-python` | Python image for `<suite>` |
| `<suite>-python-YYMMDD` | date-stamped Python image for `<suite>` |
| `<suite>-uv` | uv image for `<suite>` |
| `<suite>-uv-YYMMDD` | date-stamped uv image for `<suite>` |
| `<suite>-uv-<uv version>` | uv image for `<suite>`, stamped with the bundled uv release |

Source: https://github.com/its-me/image.debian
