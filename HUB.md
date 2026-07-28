<!-- Debian images across stable, testing, unstable, oldstable, and oldoldstable, with optional Python and uv layers. Updated daily. -->

# Debian Container Images

Debian container images built on the official `slim` variants, published daily, across five Debian suites: `stable`, `testing`, `unstable`, `oldstable`, and `oldoldstable`.

## Images

Each suite produces the same three-tier image stack:

### Base

Minimal `debian:<suite>-slim` image, upgraded (`apt-get upgrade`) and with `ca-certificates` installed. Intended as a foundation for other images.

```
docker pull 1tsme/debian:latest       # stable
docker pull 1tsme/debian:testing
docker pull 1tsme/debian:unstable
docker pull 1tsme/debian:oldstable
docker pull 1tsme/debian:oldoldstable
```

### Python

Extends the base image with `python3` and `python3-pip`. Built for the same platforms as the base image for that suite.

```
docker pull 1tsme/debian:python       # stable
docker pull 1tsme/debian:testing-python
docker pull 1tsme/debian:unstable-python
docker pull 1tsme/debian:oldstable-python
docker pull 1tsme/debian:oldoldstable-python
```

### uv

Extends the Python image with [uv](https://github.com/astral-sh/uv) — built from source on `linux/amd64`, `linux/arm64`, `linux/arm/v7`, and `linux/386`, and installed from the official prebuilt release binary on `linux/ppc64le`, `linux/riscv64`, and `linux/s390x` (where present), since compiling under QEMU emulation is impractically slow (hours, not minutes) on those architectures. `linux/arm/v5` is always excluded — Rust has no ARMv5 target and uv publishes no binary for it either.

```
docker pull 1tsme/debian:uv           # stable
docker pull 1tsme/debian:testing-uv
docker pull 1tsme/debian:unstable-uv
docker pull 1tsme/debian:oldstable-uv
docker pull 1tsme/debian:oldoldstable-uv
```

## Platforms

| Suite | Base & Python platforms | uv platforms |
|-------|--------------------------|---------------|
| `stable` | 8: `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/arm/v5`, `linux/386`, `linux/ppc64le`, `linux/riscv64`, `linux/s390x` | 7 (no `arm/v5`) |
| `testing` | 7 (no `arm/v5` — not published upstream) | 7 (same) |
| `unstable` | 7 (no `arm/v5` — not published upstream) | 7 (same) |
| `oldstable` | 7 (no `riscv64` — not published upstream) | 6 (no `arm/v5`, no `riscv64`) |
| `oldoldstable` | 4: `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/386` | 4 (same) |

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
