FROM debian:bookworm

LABEL org.opencontainers.image.source="https://github.com/the78mole/devkit-debian-package-build"
ENV DEBIAN_FRONTEND=noninteractive

# Systempakete installieren
RUN apt-get update && apt-get install -y \
    build-essential \
    devscripts \
    dpkg-dev \
    debhelper-compat \
    fakeroot \
    git \
    curl \
    gnupg \
    ca-certificates \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    shellcheck \
    sudo \
    vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add vscode user
RUN if ! getent group 1000; then \
      groupadd --gid 1000 vscode; \
    fi && \
    if ! id -u 1000 > /dev/null 2>&1; then \
      useradd --uid 1000 --gid 1000 -m vscode; \
    fi && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode

# GitHub CLI installieren
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
        gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
        > /etc/apt/sources.list.d/github-cli.list && \
    apt-get update && apt-get install -y gh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# pre-commit und Python-basierte Tools
RUN pip3 install --no-cache-dir --break-system-packages \
    pre-commit \
    black

# shfmt (Shell-Formatter) installieren
RUN curl -sSL https://github.com/mvdan/sh/releases/download/v3.7.0/shfmt_v3.7.0_linux_amd64 \
    -o /usr/local/bin/shfmt && chmod +x /usr/local/bin/shfmt

# Standard-Arbeitsverzeichnis
WORKDIR /workspace
