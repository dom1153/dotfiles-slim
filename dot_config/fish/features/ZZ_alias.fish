### vanilla overrides
abbr_safe -v cp 'cp -i'
abbr_safe -v egrep 'egrep --color=auto'
abbr_safe -v fgrep 'fgrep --color=auto'
abbr_safe -v grep 'grep --color=auto'
abbr_safe -v ll 'ls -lao'
abbr_safe -v l 'ls -lho'
abbr_safe -v la 'ls -laho'
abbr_safe -v mv 'mv -i'
abbr_safe -v pwd 'pwd --physical'
abbr_safe -v rm 'rm -i'

abbr_safe -e lg lazygit
abbr_safe ca 'chezmoi apply'
abbr_safe cu 'chezmoi update'

# abbr_safe -ev brew 'sudo -u linuxbrew -i'
