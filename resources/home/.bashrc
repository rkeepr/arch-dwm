#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# variables for PS1
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)
gitPS1(){
	gitps1=$(git branch 2>/dev/null | grep '*')
	gitps1="${gitps1:+ ${gitps1/#\* /}}"
	echo "$gitps1"
}

PS1="\[$BOLD\]\[$BLUE\]\W\[$MAGENTA\]\$(gitPS1) \[$YELLOW\]❯ \[$CYAN\]\$ \[$RESET\]"

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
alias diff="diff --color=auto"
alias weather="curl wttr.in/"
alias crypto="curl rate.sx"
alias reflector-mc="sudo reflector --latest 30 --sort rate --age 12 --protocol https --save /etc/pacman.d/mirrorlist"

export EDITOR=nvim
export TERMINAL=st-256color
export BROWSER=firefox

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+y -Du+c"
export PATH="${PATH}:/$HOME/.local/bin"
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export LESSHISTFILE="-"

# autostart dwm on login with startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
