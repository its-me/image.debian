# debian

Debian container images, built and published daily.

## Workflow

- Builds trigger on push to `main`, a daily schedule, and manual dispatch — there's no upstream release to tie a version to, so every trigger rebuilds and republishes
- The base and python images support 8 platforms: `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/arm/v5`, `linux/386`, `linux/ppc64le`, `linux/riscv64`, `linux/s390x` — matching the architectures published for the upstream `debian:stable-slim` base image
- The uv image supports the same 8 platforms except `linux/arm/v5`, since Rust has no ARMv5 target and `uv` is built from source
- Each image carries an `org.opencontainers.image.version` label set to a hash of its installed Debian packages (visible via `docker inspect`), so two pulls of the same tag can be compared without a separate versioned tag

## Images

### Base (`latest`)

Minimal `debian:stable-slim` image with `ca-certificates` installed. Intended as a foundation for other images. Built for `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/arm/v5`, `linux/386`, `linux/ppc64le`, `linux/riscv64`, and `linux/s390x`.

```
docker pull ghcr.io/its-me/debian:latest
```

### Python (`python`)

**Dockerfile:** `Dockerfile.python`
**Base:** `latest`

Extends the base image with `python3` and `python3-pip`. Built for the same 8 platforms as the base image.

```
docker pull ghcr.io/its-me/debian:python
```

### uv (`uv`)

**Dockerfile:** `Dockerfile.uv`
**Base:** `python`

Extends the Python image with [uv](https://github.com/astral-sh/uv), built from source against a Rust toolchain in a separate builder stage. Built for 7 of the 8 platforms above — `linux/arm/v5` is excluded because Rust has no ARMv5 target.

```
docker pull ghcr.io/its-me/debian:uv
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

## Registries

| Registry | Image |
|----------|-------|
| GitHub Container Registry | `ghcr.io/its-me/debian` |
| Docker Hub | `1tsme/debian` |
| Quay.io | `quay.io/itsme/debian` |

## License

[MIT](LICENSE)
