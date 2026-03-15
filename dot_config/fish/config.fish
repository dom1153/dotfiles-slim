if status is-interactive
    set fish_greeting ""

    for f in $__fish_config_dir/features/*.fish
        source $f
    end
end
