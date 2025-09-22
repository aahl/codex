#!/bin/bash

if [ -n "${APT_MIRROR}" ]; then
    sed -i "s/deb.debian.org/$APT_MIRROR/g" /etc/apt/sources.list.d/debian.sources
    apt-get -qq update >/dev/null 2>&1 &
fi
if [ -n "${NPM_REGISTRY}" ]; then
    npm config set registry "$NPM_REGISTRY"
fi;

CODEX_ENV_PYTHON_VERSION=${PYTHON_VERSION:-}
CODEX_ENV_NODE_VERSION=${NODE_VERSION:-}
CODEX_ENV_GO_VERSION=${GO_VERSION:-}
CODEX_ENV_PHP_VERSION=${PHP_VERSION:-}

if [ -n "${CODEX_ENV_PYTHON_VERSION}" ]; then
    mise use --global "python@${CODEX_ENV_PYTHON_VERSION}"
fi

if [ -n "${CODEX_ENV_NODE_VERSION}" ]; then
    mise use --global "node@${CODEX_ENV_NODE_VERSION}"
fi

if [ -n "${CODEX_ENV_GO_VERSION}" ]; then
    mise use --global "go@${CODEX_ENV_GO_VERSION}"
fi

if [ -n "${CODEX_ENV_PHP_VERSION}" ]; then
    mise use --global "php@${CODEX_ENV_PHP_VERSION}"
fi

exec "$@"