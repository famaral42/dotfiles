


alias ..='cd ..'

#alias gg='grep --color=always'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -ho --color=always'

alias bh='cat ~/.bash_history | grep' 

alias top20d='du -m | sort -nr | head -n 20'
alias top20f='du -a | sort -nr | head -n 20'

alias pyea='conda activate'
alias pyed='conda deactivate'
alias pyel='conda env list'


# RSYNC
# --partial       : Keep partially transferred files
# --progress      : Show progress during transfer
# -P              : Equivalent to --partial --progress
# -r, --recursive : recurse into directories
# -u, --update    : update only (don't overwrite newer files)
# -t, --times     : Preserve times
alias copia='rsync -Prut'

