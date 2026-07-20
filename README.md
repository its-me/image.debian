# debian

Debian container images, built and published daily.

## Images

### Base (`latest`)

Minimal `debian:stable-slim` image with `ca-certificates` installed. Intended as a foundation for other images.

```
docker pull ghcr.io/its-me/debian:latest
```

### Python (`python`)

**Dockerfile:** `Dockerfile.python`
**Base:** `latest`

Extends the base image with `python3` and `python3-pip`.

```
docker pull ghcr.io/its-me/debian:python
```

### uv (`uv`)

**Dockerfile:** `Dockerfile.uv`
**Base:** `python`

Extends the Python image with [uv](https://github.com/astral-sh/uv), built from source against a Rust toolchain in a separate builder stage.

```
docker pull ghcr.io/its-me/debian:uv
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

## Registries

| Registry | Image |
|----------|-------|
| GitHub Container Registry | `ghcr.io/its-me/debian` |
| Docker Hub | `1tsme/debian` |
| Quay.io | `quay.io/itsme/debian` |

## License

[MIT](LICENSE)
