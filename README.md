# dotfiles-slim

Disk usage is about ~1 GB (600MB of homebrew installs, 400MB of debian dependencies)

## Install dotfiles (debian)

```
sh -c "$(curl -fsLS https://raw.githubusercontent.com/dom1153/dotfiles-slim/refs/heads/main/scripts/install_debian.sh)"
```

## Try it in a docker debian instance:

```
docker run -it --rm debian
```

```
apt update && \
apt install curl vim -y && \
/bin/bash -c "$(curl -fsLS https://raw.githubusercontent.com/dom1153/dotfiles-slim/refs/heads/main/scripts/install_debian.sh)"
```
