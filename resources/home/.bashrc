# ~/.bashrc
# arch linux

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
alias weather="curl wttr.in/REPLACE_WITH_COORDINATES"
alias crypto="curl rate.sx"

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

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# autostart dwm on login with startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
