<!-- Debian images with optional Python and uv layers. Updated daily. -->

# debian

Debian container images, built and published daily.

## Images

### Base (`latest`)

Minimal `debian:stable-slim` image with `ca-certificates` installed. Intended as a foundation for other images.

```
docker pull 1tsme/debian:latest
```

### Python (`python`)

Extends the base image with `python3` and `python3-pip`.

```
docker pull 1tsme/debian:python
```

### uv (`uv`)

Extends the Python image with [uv](https://github.com/astral-sh/uv), built from source against a Rust toolchain in a separate builder stage.

```
docker pull 1tsme/debian:uv
```

## Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest base image |
| `YYMMDD` | Date-stamped base image |
| `python` | Latest Python image |
| `python-YYMMDD` | Date-stamped Python image |
| `uv` | Latest uv image |
| `uv-YYMMDD` | Date-stamped uv image |

Source: https://github.com/its-me/image.debian
