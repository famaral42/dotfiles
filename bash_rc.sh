

# Teclado Brasileiro ABTN2
#setxkbmap -model abnt2 -layout br


# bash_rc.sh full path script
_SCRIPT="$(readlink -f ${BASH_SOURCE[0]})"

# dotfiles folder
_SCRIPT_DIR="$(dirname $_SCRIPT)" 


function srcBash(){
	a="${_SCRIPT_DIR}/$1"
	if [ -e "$a" ]; then
		source $a
	else
		echo "Did NOT find" $a
	fi
}


srcBash less_termcap.sh
srcBash bash_profile.sh
srcBash bash_colors.sh
srcBash bash_alias.sh
srcBash bash_functions.sh
srcBash bash_git.sh


function ps1_n_files(){
	echo "\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files"
}

function ps1_folder_size(){
	echo "\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b"
}


PS1=""
PS1+="${ccYellow}\u" 					# USER
PS1+="${ccWB}@${cReset}" 	# @
PS1+="${ccGreen}\h" 					# HOST
PS1+="${ccWB}:${cReset}" 	# :
PS1+="${ccBlue}\w" 			# WORKING DIRECTORY
#PS1+="${ccCyan}`ps1_n_files`" 			# NUMBER OF FILES
#PS1+="${ccYellow} `ps1_folder_size`" 	# SIZE OF FILES
PS1+="${ccPurple}\`parse_git_branch\`" 	# GIT BRANCH
PS1+="${ccRed}\`parse_git_dirty\`" 		# GIT STATUS
PS1+="${ccWB}\$ ${cReset}"	# $


export PS1

export HISTCONTROL=ignoredups:erasedups
