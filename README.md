# 🧰 devkit-debian-package-build

Docker-based development image for building Debian source and binary packages.  
Includes tools for packaging, linting, pre-commit checks, and CI integration.

![Build](https://github.com/the78mole/devkit-debian-package-build/actions/workflows/build-check.yml/badge.svg)
![Release](https://github.com/the78mole/devkit-debian-package-build/actions/workflows/release.yml/badge.svg)
![Pre-commit Test](https://github.com/the78mole/devkit-debian-package-build/actions/workflows/test-precommit.yml/badge.svg)
![Version](https://img.shields.io/github/v/tag/the78mole/devkit-debian-package-build?label=version&sort=semver)
![License](https://img.shields.io/github/license/the78mole/devkit-debian-package-build)
![Renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovatebot)

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/the78mole/devkit-debian-package-build)
---

## 🧰 Using as a Devcontainer

You can use this image directly in a Devcontainer setup, e.g. for Debian packaging, Python linting, or as a CI-like local development environment.

### Example: .devcontainer/devcontainer.json
```json
{
  "name": "Debian Devkit",
  "image": "ghcr.io/the78mole/devkit-debian-package-build:latest",
  "features": {},
  "postCreateCommand": "pre-commit install || true",
  "remoteUser": "vscode"
}
```

## 📦 Included Tools

| Category         | Tools                                                             |
|------------------|--------------------------------------------------------------------|
| **Debian Build** | `devscripts`, `dpkg-dev`, `debhelper-compat`, `fakeroot`           |
| **Python**       | `python3`, `setuptools`, `wheel`, `pip`, `black`                   |
| **Linting**      | `pre-commit`, `shellcheck`, `shfmt`                                |

---

## 📤 Availability

This image is automatically published to GitHub Container Registry (`ghcr.io`) on each merge to `main`:

```text
ghcr.io/the78mole/devkit-debian-package-build:latest
ghcr.io/the78mole/devkit-debian-package-build:vX.Y.Z
```

