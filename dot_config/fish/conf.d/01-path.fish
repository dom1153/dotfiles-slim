switch (uname)
    case Darwin
        if test -f /opt/homebrew/bin/brew
            eval "$(/opt/homebrew/bin/brew shellenv)"
        end
    case '*'
        if test -f /home/linuxbrew/.linuxbrew/bin/brew
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        end
end
