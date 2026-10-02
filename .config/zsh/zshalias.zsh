alias dotfileconfig="/usr/bin/git --git-dir=$HOME/.dotfilesgit --work-tree=$HOME"

alias formatdate="/usr/bin/date +\%F\ \%T\ \%z"
alias dategit="/usr/bin/date '+%a %b %d %H:%M:%S %Y %z'"

alias v="/usr/bin/nvim"

alias fdh="/usr/bin/fd --hidden"
alias rgh="/usr/bin/rg --hidden"
alias e="/usr/bin/eza --icons --group-directories-first"
alias l="/usr/bin/eza --icons -l --group-directories-first" # list
alias a="/usr/bin/eza --icons -a --group-directories-first" # show hidden files
alias la="/usr/bin/eza --icons -la --group-directories-first" # show hidden files, list
alias etree="/usr/bin/eza --icons --tree" # coloured tree with icons

alias pptx_to_pdf="/usr/bin/soffice --headless --convert-to pdf *.ppt* && rm *.pptx"

alias fetch="/usr/bin/fastfetch --color blue"

#archives
#command <archive_name> <files/directories>
alias mktar="/usr/bin/tar -cvf"
alias mkbz2="/usr/bin/tar -cvjf"
alias mkgz="/usr/bin/tar -cvzf"
alias mkxz="/usr/bin/tar -cvJf"
alias mkzstd="/usr/bin/tar --zstd -cvf"
#command <archive_name>
alias untar="/usr/bin/tar -xvf"
alias unbz2="/usr/bin/tar -xvjf"
alias ungz="/usr/bin/tar -xvzf"
alias unxz="/usr/bin/tar -xvJf"
alias unzstd="/usr/bin/tar --zstd -xvf"

alias cflags="echo -Wall -pedantic -Werror -Wextra -Wshadow -Wstrict-aliasing -Wstrict-overflow -O2 -march=native"
alias cflagscp="cflags | wl-copy"
alias gpp="/usr/bin/g++ -Wall -pedantic -Werror -Wextra -Wshadow -Wstrict-aliasing -Wstrict-overflow"
alias cc="/usr/bin/cc --std=c23 -Wall -Wextra -Wpedantic -Werror -Wshadow -Wconversion -Wstrict-aliasing -Wsign-conversion -Wformat=2 -Wundef -Wcast-qual -Wcast-align -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wswitch-enum -Wnull-dereference -Wdouble-promotion -fno-common -O2 -march=native"
alias valgrindall="/usr/bin/valgrind --show-leak-kinds=all --leak-check=full" 

# music
alias mpvnn="/usr/bin/mpv --no-audio-display --no-video --loop-file=inf --volume=50 $HOME/music/Xeno/Xenoblade\ 3/5.069\ Noah\ and\ N\ \(Phase\ 2\)\ \[v2\].flac"
alias mpvs="/usr/bin/mpv --no-audio-display --loop-playlist=inf --no-video --volume=43"

# avoid wget hosts file on home dir
alias wget="/usr/bin/wget --hsts-file=$XDG_STATE_HOME/wget-hsts"

# pacman reflector update mirrors
alias updatemirrors="sudo /usr/bin/reflector --latest 30 --country Greece,Germany,Netherlands --protocol https --age 24 --sort score --save /etc/pacman.d/mirrorlist"
alias updatemirrorsr="sudo /usr/bin/reflector --latest 30 --country Greece,Germany,Netherlands --protocol https --age 24 --sort rate --save /etc/pacman.d/mirrorlist"

# sxholh
alias sch="/usr/bin/cat $HOME/documents/schedule.txt"
