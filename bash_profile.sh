# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

# If set, the history list is appended to the file named by the value of the
# HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend

# If set, minor errors in the spelling of a directory component in a cd command
# will be corrected. The errors checked for are transposed characters,
# a missing character, and a character too many. If a correction is found,
# the corrected path is printed, and the command proceeds.
# This option is only used by interactive shells.
shopt -s cdspell

# If set, Bash checks the window size after each command and,
# if necessary, updates the values of LINES and COLUMNS.
shopt -s checkwinsize
