function git_clone -d 'Clone a repo with custom folder name (author_repo)'
    # bash -c 'repo=$(echo "$1" | cut -d/ -f1-5); git clone --depth 1 "${repo%.git}" "$(echo "$repo" | cut -d/ -f4-5 | tr "/" "_")"' -- "https://github.com/user/repo"
    if test (count $argv) -lt 1
        echo "Usage: git_clone <URL>"
        return
    end

    set -l repo (echo "$argv[1]" | cut -d/ -f1-5 | cut -d\? -f1)
    set -l folder (echo "$repo" | cut -d/ -f4-5 | tr "/" "_")

    git clone --depth 1 $repo $folder
end
