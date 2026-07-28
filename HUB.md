<!-- Debian images with optional Python and uv layers. Updated daily. -->

# debian

Debian container images, built and published daily.

## Images

### Base (`latest`)

Minimal `debian:stable-slim` image with `ca-certificates` installed. Intended as a foundation for other images. Built for `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/arm/v5`, `linux/386`, `linux/ppc64le`, `linux/riscv64`, and `linux/s390x`.

```
docker pull 1tsme/debian:latest
```

### Python (`python`)

Extends the base image with `python3` and `python3-pip`. Built for the same 8 platforms as the base image.

```
docker pull 1tsme/debian:python
```

### uv (`uv`)

Extends the Python image with [uv](https://github.com/astral-sh/uv) — built from source on `linux/amd64`, `linux/arm64`, `linux/arm/v7`, and `linux/386`, and installed from the official prebuilt release binary on `linux/ppc64le`, `linux/riscv64`, and `linux/s390x`, where compiling under QEMU emulation is impractically slow (hours, not minutes). Built for 7 of the 8 platforms above — `linux/arm/v5` is excluded because Rust has no ARMv5 target and uv publishes no binary for it either.

```
docker pull 1tsme/debian:uv
```

## Tags

| Tag | Description |
|-----|-------------|
| `latest` | Base image |
| `YYMMDD` | Date-stamped base image |
| `python` | Python image |
| `python-YYMMDD` | Date-stamped Python image |
| `uv` | uv image |
| `uv-YYMMDD` | Date-stamped uv image |
| `uv-<uv version>` | uv image, stamped with the bundled uv release (e.g. `uv-0.11.32`) |

Source: https://github.com/its-me/image.debian
