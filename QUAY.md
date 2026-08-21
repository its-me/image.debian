# Debian Container Images

Debian container images built on the official images, published daily, across five Debian suites (`stable`, `testing`, `unstable`, `oldstable`, `oldoldstable`), each in up to three flavors: the default (full) image, `slim`, and `backports` — `backports` isn't published for `unstable` or `oldoldstable`, since Debian doesn't maintain a live backports pocket for either (backports are only maintained for the current `stable` and, during its transition window, `oldstable`).

## Images

Each suite/flavor combination produces the same three-tier image stack:

### Base

Minimal `debian:<suite>`, `debian:<suite>-slim`, or `debian:<suite>-backports` image, upgraded (`apt-get upgrade`) and with `ca-certificates` installed. Intended as a foundation for other images.

```
docker pull quay.io/itsme/debian:latest       # stable, default flavor
docker pull quay.io/itsme/debian:slim         # stable, slim flavor
docker pull quay.io/itsme/debian:backports    # stable, backports flavor
docker pull quay.io/itsme/debian:testing
docker pull quay.io/itsme/debian:testing-slim
docker pull quay.io/itsme/debian:testing-backports
docker pull quay.io/itsme/debian:unstable
docker pull quay.io/itsme/debian:unstable-slim
docker pull quay.io/itsme/debian:oldstable
docker pull quay.io/itsme/debian:oldstable-slim
docker pull quay.io/itsme/debian:oldstable-backports
docker pull quay.io/itsme/debian:oldoldstable
docker pull quay.io/itsme/debian:oldoldstable-slim
```

### Python

Extends the base image with `python3` and `python3-pip`. Built for the same platforms as the base image for that suite/flavor.

```
docker pull quay.io/itsme/debian:python              # stable, default flavor
docker pull quay.io/itsme/debian:slim-python          # stable, slim flavor
docker pull quay.io/itsme/debian:backports-python     # stable, backports flavor
docker pull quay.io/itsme/debian:testing-python
docker pull quay.io/itsme/debian:testing-slim-python
docker pull quay.io/itsme/debian:testing-backports-python
```

### uv

Extends the Python image with [uv](https://github.com/astral-sh/uv) — built from source on `linux/amd64`, `linux/arm64`, `linux/arm/v7`, and `linux/386`, and installed from the official prebuilt release binary on `linux/ppc64le`, `linux/riscv64`, and `linux/s390x` (where present), since compiling under QEMU emulation is impractically slow (hours, not minutes) on those architectures. `linux/arm/v5` is always excluded — Rust has no ARMv5 target and uv publishes no binary for it either.

```
docker pull quay.io/itsme/debian:uv                  # stable, default flavor
docker pull quay.io/itsme/debian:slim-uv              # stable, slim flavor
docker pull quay.io/itsme/debian:backports-uv         # stable, backports flavor
docker pull quay.io/itsme/debian:testing-uv
docker pull quay.io/itsme/debian:testing-slim-uv
docker pull quay.io/itsme/debian:testing-backports-uv
```

## Platforms

Each suite/flavor builds whatever platforms Docker Hub currently publishes for `debian:<suite><flavor-suffix>`, resolved from the upstream manifest at build time rather than hardcoded — Debian's per-suite architecture support shifts as its release cycle rolls forward, especially for `oldstable` and `oldoldstable`, and can also differ between the default, `slim`, and `backports` flavors of the same suite. The uv image additionally always excludes `linux/arm/v5`, since neither Rust nor uv's release binaries target it.

## Tags

| Tag pattern | Description |
|-------------|-------------|
| `latest` | `stable` base image, default (non-slim) flavor |
| `YYMMDD` | date-stamped `stable` base image, default flavor |
| `python` | `stable` Python image, default flavor |
| `python-YYMMDD` | date-stamped `stable` Python image, default flavor |
| `uv` | `stable` uv image, default flavor |
| `uv-YYMMDD` | date-stamped `stable` uv image, default flavor |
| `uv-<uv version>` | `stable` uv image, default flavor, stamped with the bundled uv release (e.g. `uv-0.11.32`) |
| `<label>` | base image for `<label>` — `slim`, `backports`; `testing`, `testing-slim`, `testing-backports`; `unstable`, `unstable-slim`; `oldstable`, `oldstable-slim`, `oldstable-backports`; `oldoldstable`, `oldoldstable-slim` |
| `<label>-YYMMDD` | date-stamped base image for `<label>` |
| `<label>-python` | Python image for `<label>` |
| `<label>-python-YYMMDD` | date-stamped Python image for `<label>` |
| `<label>-uv` | uv image for `<label>` |
| `<label>-uv-YYMMDD` | date-stamped uv image for `<label>` |
| `<label>-uv-<uv version>` | uv image for `<label>`, stamped with the bundled uv release |

Source: https://github.com/its-me/image.debian
