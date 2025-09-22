# 🧑‍💻 CodeX in Docker

## 🐳 Usage
```bash
docker run --rm -it -v "$(pwd):/app" -v ~/.codex:/root/.codex ghcr.io/aahl/codex
```

## 🇨🇳 GLM 4.5
使用GLM的最新模型（glm-4.5）驱动您的CodeX。[申请ApiKey](https://www.bigmodel.cn/invite?icode=EwilDKx13%2FhyODIyL%2BKabHHEaazDlIZGj9HxftzTbt4%3D)
> GLM还提供了其他很多[免费好用](https://docs.bigmodel.cn/cn/guide/models/free/glm-4.5-flash)的模型！

```toml
# vim ~/.codex/config.toml
[model_providers.glm]
name = "GLM Coding Plan"
env_key = "GLM_AUTH_TOKEN"
base_url = "https://open.bigmodel.cn/api/coding/paas/v4"

[profiles.glm45]
model = "glm-4.5"
model_provider = "glm"

[profiles.glm45flash]
model = "glm-4.5-flash"
model_provider = "glm"
```

```bash
# vim ~/.bashrc
export GLM_AUTH_TOKEN=your_glm_token
alias codex-glm='docker run --rm -it -v "$(pwd):/app" -v ~/.codex:/root/.codex -e GLM_AUTH_TOKEN="$GLM_AUTH_TOKEN" -e APT_MIRROR=mirrors.ustc.edu.cn -e NPM_REGISTRY=https://registry.npmmirror.com ghcr.nju.edu.cn/aahl/codex codex --profile glm45flash'
```

## 🔗 Links
- [Docker Image Tags](https://github.com/aahl/codex/pkgs/container/codex/versions?filters[version_type]=tagged)
- https://www.bigmodel.cn/invite?icode=EwilDKx13%2FhyODIyL%2BKabHHEaazDlIZGj9HxftzTbt4%3D
