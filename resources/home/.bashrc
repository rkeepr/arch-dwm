# ~/.bashrc
# arch linux

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:~/.local/bin

# PS1
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

# Alias
alias \
    ls="ls -hN --color=auto --group-directories-first" \
    la="ls -a" \
    ll="ls -l" \
    lla="ls -la" \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -Iv" \
    mkdir="mkdir -pv" \
    bc="bc -ql" \
    grep="grep --color=auto" \
    diff="diff --color=auto" \
    ffmpeg="ffmpeg -hide_banner" \
    ip="ip -color=auto" \
    crypto="curl rate.sx" \
    ytv="yt-dlp --embed-metadata" \
    yta="yt-dlp -x --embed-metadata --embed-thumbnail" \
    ytf="yt-dlp -F" \
    crypto="curl rate.sx"

# Default programs
export EDITOR=nvim
export TERMINAL=st-256color
export BROWSER=firefox

# Program settings
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+y -Du+c"
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Clean up $HOME
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
