if [ -d /home/linuxbrew/ ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

if [[ $- == *i* ]] && [[ "$SHELL" != *fish* ]] && [ -n "$PS1" ] && [[ "$(tty)" == /dev/* ]] && [[ $(command -v fish) ]]; then
    exec fish
fi
