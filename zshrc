## Configure and load oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vortura"
DISABLE_AUTO_UPDATE="true"
plugins=(brew docker git osx pip vagrant)
if [[ $(uname) == "Linux" ]]; then
    plugins+=(ssh-agent)
fi

source $ZSH/oh-my-zsh.sh

## Enable vi mode
vi-search-fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}

bindkey -v
bindkey -M vicmd v edit-command-line
autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix
export KEYTIMEOUT=1

## Go Stuff
mkdir -p ~/working/go
export GOPATH=~/working/go

## General environment stuff
export PATH=${HOME}/bin:${GOPATH}/bin:${HOME}/.local/bin:/opt/terraform:/usr/local/sbin:/usr/local/bin:/Applications/Racket\ v6.0/bin:${PATH}:${HOME}/.gem/ruby/2.5.0/bin
export VISUAL=vim
export EDITOR=vim


## On Linux:
#    * Use xcape to map tapped ctrl to escape
#    * Set ls color output
#
if [[ $(uname) == "Linux" ]]; then
    setxkbmap -option 'caps:ctrl_modifier'
    xcape -e 'Caps_Lock=Escape'
    eval $(dircolors ~/.dir_colors)
    export LS_OPTIONS='--color=auto'
fi


## Python stuff
#if [[ $(uname) == "Linux" ]]; then
    #export VEW_PATH="/usr/bin/virtualenvwrapper.sh"
#else
    #export VEW_PATH="/usr/local/bin/virtualenvwrapper.sh"
#fi
#
#if [[ -f $VEW_PATH ]]; then
    #export WORKON_HOME="${HOME}/lib/virtualenvs"
    #export PROJECT_HOME="${HOME}/projects"
    #[[ -d $WORKON_HOME ]] || mkdir -p $WORKON_HOME
    #source $VEW_PATH
    #export VIRTUAL_ENV_DISABLE_PROMPT=1
#
    ### pip should only run if there is a virtualenv currently activated
    #export PIP_REQUIRE_VIRTUALENV=true
    ## # cache pip-installed packages to avoid re-downloading
    #export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
#fi



#############
## Aliases ##
#############
alias ls="ls $LS_OPTIONS"


###############
## Functions ##
###############

## tmux

# Generic wrapper to set tmux window name to remote hostname
remote_wrapper() {

    local ssh_cmd=$1
    shift

    # Do nothing if we are not inside tmux or ssh is called without arguments
    if [[ $# == 0 || -z $TMUX ]]; then
        TERM=xterm-256color command ${ssh_cmd} $@
        return
    fi

    # The hostname is the last parameter (i.e. ${(P)#})
    # %%.* truncates the domain portion of the hostname
    local remote=${${(P)#}%%.*}
    local this_window="$(tmux display-message -p '#S:#I')"
    local renamed=0

    # Save the current name
    if [[ $remote != -* ]]; then
        renamed=1
        tmux rename-window $remote
    fi

    TERM=xterm-256color command ${ssh_cmd} $@
    if [[ $renamed == 1 ]]; then
        tmux set-window-option -q -t ${this_window} automatic-rename on
    fi
}


# Wrap ssh to set tmux window name.
ssh() {
    remote_wrapper "ssh" $@
}


# Same as the ssh wrapper, but for mosh
mosh() {
    remote_wrapper "mosh" $@
}


# Start a web server in the current directory
server() {
    local port="${1:-8000}"
    open "http://localhost:${port}" && python -m SimpleHTTPServer $port
}

# Start Chrome
chrome () {
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

##################
## Local Config ##
##################

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
