# Debian Container Images

Debian container images built on the official `slim` variants, published daily, across five Debian suites: `stable`, `testing`, `unstable`, `oldstable`, and `oldoldstable`.

## Workflow

- Each suite has its own workflow (`.github/workflows/{stable,testing,unstable,oldstable,oldoldstable}.yaml`), all built from the same three Dockerfiles — the suite/base image tag is passed in as a build-arg (`SUITE`, `BASE_TAG`, `PYTHON_TAG`) rather than hardcoded
- There's no upstream release to tie a version to, so every trigger rebuilds and republishes
- The build matrix for each suite is resolved from `debian:<suite>-slim`'s upstream manifest at run time rather than hardcoded — see [Platforms](#platforms)
- Each image carries an `org.opencontainers.image.version` label set to the underlying Debian release codename (e.g. `trixie`, visible via `docker inspect`)

## Images

Each suite produces the same three-tier image stack:

### Base

Minimal `debian:<suite>-slim` image, upgraded (`apt-get upgrade`) and with `ca-certificates` installed. Intended as a foundation for other images.

```
docker pull ghcr.io/its-me/debian:latest       # stable
docker pull ghcr.io/its-me/debian:testing
docker pull ghcr.io/its-me/debian:unstable
docker pull ghcr.io/its-me/debian:oldstable
docker pull ghcr.io/its-me/debian:oldoldstable
```

### Python

**Dockerfile:** `Dockerfile.python`
**Base:** the base image for the same suite

Extends the base image with `python3` and `python3-pip`. Built for the same platforms as the base image for that suite.

```
docker pull ghcr.io/its-me/debian:python       # stable
docker pull ghcr.io/its-me/debian:testing-python
docker pull ghcr.io/its-me/debian:unstable-python
docker pull ghcr.io/its-me/debian:oldstable-python
docker pull ghcr.io/its-me/debian:oldoldstable-python
```

### uv

**Dockerfile:** `Dockerfile.uv`
**Base:** the Python image for the same suite

Extends the Python image with [uv](https://github.com/astral-sh/uv) — built from source on `linux/amd64`, `linux/arm64`, `linux/arm/v7`, and `linux/386`, and installed from the official prebuilt release binary on `linux/ppc64le`, `linux/riscv64`, and `linux/s390x` (where present), since compiling under QEMU emulation is impractically slow (hours, not minutes) on those architectures. `linux/arm/v5` is always excluded — Rust has no ARMv5 target and uv publishes no binary for it either.

```
docker pull ghcr.io/its-me/debian:uv           # stable
docker pull ghcr.io/its-me/debian:testing-uv
docker pull ghcr.io/its-me/debian:unstable-uv
docker pull ghcr.io/its-me/debian:oldstable-uv
docker pull ghcr.io/its-me/debian:oldoldstable-uv
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

## Registries

| Registry | Image |
|----------|-------|
| GitHub Container Registry | `ghcr.io/its-me/debian` |
| Docker Hub | `1tsme/debian` |
| Quay.io | `quay.io/itsme/debian` |

## License

[MIT](LICENSE)
