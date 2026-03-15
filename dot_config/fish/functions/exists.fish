function exists -d "Check if a command exists"
    if ! type -q $argv[1]
        return 1
    end
end
