if exists yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end

if exists atuin
    atuin init fish --disable-up-arrow | source
end

if exists zoxide
    zoxide init --cmd cd fish | source
end
    
if exists starship
    # should remove warning for git branch taking too long to load
    set -gx STARSHIP_LOG error
    starship init fish | source
end

if exists hx
    set -gx EDITOR hx
end
