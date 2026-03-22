#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Logging functions
info() {
    echo -e "${BLUE}==>${NC} ${BOLD}$1${NC}"
}

success() {
    echo -e "${GREEN}==>${NC} ${BOLD}$1${NC}"
}

warn() {
    echo -e "${YELLOW}Warning:${NC} $1"
}

error() {
    echo -e "${RED}Error:${NC} $1" >&2
    exit 1
}

command_exists() {
    command -v "$1" &> /dev/null
}

setup_brew_permissions() {
  $SUDO apt update
  $SUDO apt install sudo -y
  useradd -m -s /bin/bash linuxbrew
  echo "linuxbrew ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/linuxbrew
  rm -f /home/linuxbrew/.bashrc
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/linuxbrew/.bashrc
}

install_brew() {
  # Use sudo if available and not root
  SUDO=""
  if [ "$(id -u)" -ne 0 ] && command_exists sudo; then
      SUDO="sudo"
  fi

  $SUDO apt update
  $SUDO apt install build-essential procps curl file git -y

  sudo -u linuxbrew NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  cat <<'EOF' >> "$HOME"/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

if [[ $- == *i* ]] && [[ "$SHELL" != *fish* ]] && [ -n "$PS1" ] && [[ "$(tty)" == /dev/* ]] && [[ $(command -v fish) ]]; then
    exec fish
fi
EOF

  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv sh)"

  success "homebrew installed"
}

install_essential() {
  sudo -u linuxbrew -i brew install chezmoi helix fish yazi lazygit difftastic starship zellij
  success "essential apps installed"
}

init_chezmoi() {
  chezmoi init --apply dom1153/dotfiles-slim
  success "chezmoi initiated and applied"
}

main() {
  setup_brew_permissions
  install_brew
  install_essential
  init_chezmoi
  success "Script complete. Please run 'exec bash' or restart the shell"
}

main "$@"
