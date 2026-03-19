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
rm -f /.dockerenv && \
apt update && \
apt install curl vim -y && \
/bin/bash -c "$(curl -fsLS https://raw.githubusercontent.com/dom1153/dotfiles-slim/refs/heads/main/scripts/install_debian.sh)"
```

## Core script (debian)

```
sudo apt install build-essential procps curl file git -y
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)" >> "$HOME"/.bashrc
brew install chezmoi helix fish yazi lazygit difftastic
chezmoi init --apply dom1153/dotfiles-slim
exec fish
```
