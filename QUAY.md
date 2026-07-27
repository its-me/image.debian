# debian

Debian container images, built and published daily.

## Images

### Base (`latest`)

Minimal `debian:stable-slim` image with `ca-certificates` installed. Intended as a foundation for other images.

```
docker pull quay.io/itsme/debian:latest
```

### Python (`python`)

Extends the base image with `python3` and `python3-pip`.

```
docker pull quay.io/itsme/debian:python
```

### uv (`uv`)

Extends the Python image with [uv](https://github.com/astral-sh/uv), built from source against a Rust toolchain in a separate builder stage.

```
docker pull quay.io/itsme/debian:uv
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

Source: https://github.com/its-me/image.debian
