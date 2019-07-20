# http://ezprompt.net/ Josh Matthews

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=${ccRed}${cBold}`parse_git_dirty`${cReset}
		PSgit="${ccPurple}${cBold}["
		PSgit+="${BRANCH}"
		PSgit+="${STAT}"
		PSgit+="${ccPurple}${cBold}]"
		echo ${PSgit}
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}



# GIT LEARNING --------------------------------------------------------------- #

# Create file arq_XXX and do "git add" and "git commit"
function arq(){
    t=$(date +%H:%M:%S)
    echo "Texto no arquivo $1 criado em $t" >> arq_$1
    git add arq_$1
    msg=$(echo Criado arquivo arq_$1 em $t)
    git commit -m "$msg"
}

# Git init and create files on master and two branches
function gitmodel(){
    rm -rf *
    rm -rf .*
    git init
    arq 01_1m
    git branch ramo_a
    git branch ramo_b
    git checkout ramo_a
    arq 02_1a
    git checkout ramo_b
    arq 03_1b
    git checkout master
    arq 04_2m
    git checkout ramo_a
    arq 05_2a
    git checkout ramo_b
    arq 06_2b
    git checkout master
    clear
    git log --oneline --graph --all
}
