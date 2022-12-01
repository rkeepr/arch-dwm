#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# variables for PS1
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
bold=$(tput bold)
color_reset=$(tput sgr0)
gitPS1(){
	gitps1=$(git branch 2>/dev/null | grep '*')
	gitps1="${gitps1:+ ${gitps1/#\* /}}"
	echo "$gitps1"
}

PS1="\[$bold\]\[$blue\]\W\[$magenta\]\$(gitPS1) \[$yellow\]❯ \[$cyan\]\$ \[$color_reset\]"

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
