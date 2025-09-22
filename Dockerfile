FROM ghcr.io/basepkg/debian

WORKDIR /app

ENV HOME=/root
ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt update; \
    apt install -y --no-install-recommends bash curl git gnupg nodejs npm; \
    mkdir -p /root/npm-cache; \
    chmod 777 /root/npm-cache;
RUN npm install -g @openai/codex

RUN install -dm 0755 /etc/apt/keyrings \
    && curl -fsSL https://mise.jdx.dev/gpg-key.pub | gpg --batch --yes --dearmor -o /etc/apt/keyrings/mise-archive-keyring.gpg \
    && chmod 0644 /etc/apt/keyrings/mise-archive-keyring.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg] https://mise.jdx.dev/deb stable main" > /etc/apt/sources.list.d/mise.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends mise/stable \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'eval "$(mise activate bash)"' >> /etc/profile \
    && mise settings set experimental true \
    && mise settings set override_tool_versions_filenames none \
    && mise settings add idiomatic_version_file_enable_tools "[]"

VOLUME /root
ENV npm_config_cache=/root/npm-cache
ENV SHELL=/bin/bash
ENV PATH=$HOME/.local/share/mise/shims:$PATH

ADD run.sh /
ENTRYPOINT ["/run.sh"]
CMD ["codex"]