

# EXTRACT almost anything
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1     ;;
            *.tar.gz)   tar xvzf $1     ;;
            *.tar.xz )  tar Jxvf $1     ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xvf $1      ;;
            *.tbz2)     tar xvjf $1     ;;
            *.tgz)      tar xvzf $1     ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *)          echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


########################################################################
# CD on Exit  for  fff (Fucking Fast File-Manager)
fff() {
    f3m "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}


function marca() {
	sed "s/$1/\x1b[41m&\x1b[0m/g"
}


# Simple compile 1file and run C++
function roda() {

	exe=${1}.EXE

	test -e ${exe} && rm ${exe}

	clear

	g++ ${1} -o ${exe}

	echo -e "Running ${1} -> ${exe}\nStarted at "; date "+%F %X"; echo ""

	time ./${exe}

	rm ${exe}
}


function ping_one_ip()
{
  ping -b -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo IP: $i is up
}

function ping_all_ip()
{
    local base=${1:-192.168.0}

    for i in ${base}.{1..254} 
    do
        ping_one_ip $i & disown
    done
}