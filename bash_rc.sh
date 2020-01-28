

# Teclado Brasileiro ABTN2
setxkbmap -model abnt2 -layout br


function srcBash(){
	a="$HOME/dotfiles/" # dotfiles FOLDER
	a=$a$1
	if [ -e "$a" ]; then
		source $a
	else
		echo "Did NOT find" $a
	fi
}


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
PS1+="${ccWhite}${cBold}@${cReset}" 	# @
PS1+="${ccGreen}\h" 					# HOST
PS1+="${ccWhite}${cBold}:${cReset}" 	# :
PS1+="${ccBlue}\w${cReset}" 			# WORKING DIRECTORY
#PS1+="${ccWhite}${cBold} - ${cReset}" 	# -
#PS1+="${ccCyan}`ps1_n_files`" 			# NUMBER OF FILES
#PS1+="${ccYellow} `ps1_folder_size`" 	# SIZE OF FILES
#PS1+="${ccWhite}${cBold} - ${cReset}" 	# -
#PS1+="${ccPurple}\`ps1_git_branch\`" 	# GIT BRANCH
#PS1+="${ccRed}\`ps1_git_status\`" 		# GIT STATUS
PS1+=`parse_git_branch` 			# GIT BRANCH STATUS
PS1+="${ccWhite}${cBold}\$ ${cReset}"	# $


export PS1
