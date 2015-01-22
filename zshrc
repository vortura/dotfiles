## Configure and load oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vortura"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git osx pip vagrant)

source $ZSH/oh-my-zsh.sh


## General environment stuff
export PATH=${HOME}/bin:/usr/local/sbin:/usr/local/bin:/Applications/Racket\ v6.0/bin:${PATH}
export VISUAL=vim
export EDITOR=vim


## Python stuff
export VEW_PATH="/usr/local/bin/virtualenvwrapper.sh"

if [[ -x $VEW_PATH ]]; then
    export WORKON_HOME="${HOME}/lib/virtualenvs"
    export PROJECT_HOME="${HOME}/Dropbox/projects"
    [[ -d $WORKON_HOME ]] || mkdir -p $WORKON_HOME
    source $VEW_PATH
    export VIRTUAL_ENV_DISABLE_PROMPT=1

    # pip should only run if there is a virtualenv currently activated
    export PIP_REQUIRE_VIRTUALENV=true
    # # cache pip-installed packages to avoid re-downloading
    export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
fi


#############
## Aliases ##
#############
alias ls='ls -FG'


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
        TERM=screen-256color command ${ssh_cmd} $@
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

    TERM=screen-256color command ${ssh_cmd} $@
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
