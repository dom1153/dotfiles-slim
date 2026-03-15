function abbr_safe -d "abbr wrapper to override builtins cleanly"
    argparse e v h/help -- $argv

    if set -ql _flag_help
        or test (count $argv) -lt 2

        echo "Usage: abbr_safe [OPTIONS] <ABBR> <COMMAND> -- <abbr args>"
        echo ""
        echo "Options:"
        echo "  -e Only create this abbreviation if COMMAND exists"
        echo "  -v Create an escape hatch [v]anilla abbreviation if ABBR is an existing command (rm -> rrm)"
        return 0
    end

    if set -ql _flag_e
        set -l command (string split ' ' -- "$argv[2]" | head -n1)
        if not type -q $command
            return 1
        end
    end

    if set -ql _flag_v
        and type -q $argv[1]

        set -l exe $argv[1]
        set -l firstLetter (string sub $exe --length 1)
        abbr_safe $firstLetter$exe "$exe"
    end

    ## -a overrides existing abbr
    ## --position command means abbrevation will only
    #       expand when it is positioned as a command,
    #       not as an argument to another command
    abbr -a \
        --position command \
        $argv[3..-1] \
        $argv[1] \
        $argv[2]
end
