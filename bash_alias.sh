

alias ..='cd ..'   # a la lazy
alias cd..='cd ..' # a la DOS

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# LS  list directory contents
# -a  do not ignore entries starting with
# -F  append indicator (one of */=>@|) to entries
# -h  with -l, print sizes in human readable format (e.g., 1K 234M 2G)
# -o  like -l, but do not list group information
# -r  reverse order while sorting
# -R  list subdirectories recursively
# -t  sort by modification time, newest first
# -X  sort alphabetically by entry extension
alias l='ls -ohXF --color=always'
alias ll='ls -lhXF --color=always'
alias lt='ll -rt --time-style=+"%Y-%m-%d--%H:%M:%S"'



alias bh='cat ~/.bash_history | grep' 

alias top20d='du -m | sort -nr | head -n 20'
alias top20f='du -a | sort -nr | head -n 20'

alias pyea='conda activate'
alias pyed='conda deactivate'
alias pyel='conda env list'

alias jn='jupyter-notebook'

alias soo='source ~/.bashrc'

alias rmbashistory='cat /dev/null > ~/.bash_history && history -c && exit'

# RSYNC
# --partial            : Keep partially transferred files
# --progress           : Show progress during transfer
# -P                   : Equivalent to --partial --progress
# -r, --recursive      : Recurse into directories
# -u, --update         : Update only (don't overwrite newer files)
# -t, --times          : Preserve times
# -h, --human-readable : Human-Readable format
# --exclude=PATTERN    : Exclude files matching PATTERN
alias copia='rsync -Pruth --exclude={.*,*~,.ipynb_checkpoints}'

