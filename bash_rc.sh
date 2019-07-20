

# Teclado Brasileiro ABTN2
setxkbmap -model abnt2 -layout br

function srcBash(){
	a="$HOME/dotfiles/" # dotfiles FOLDER
	a=$a$1
	if [ -e "$a" ]; then
		source $a
	else
		echo NOPE $a
	fi
}

srcBash bash_profile.sh
srcBash bash_colors.sh
srcBash bash_alias.sh
srcBash bash_functions.sh
srcBash bash_git.sh


PS1=""
PS1+="${ccYellow}\u"
PS1+="${ccWhite}${cBold}@${cReset}"
PS1+="${ccGreen}\h"
PS1+="${ccWhite}${cBold}:${cReset}"
PS1+="${ccBlue}\W${cReset}"
PS1+="\`parse_git_branch\`"
PS1+="${ccWhite}${cBold}> ${cReset}"

export PS1
