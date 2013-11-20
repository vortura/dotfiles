ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vortura"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git osx pip vagrant)

source $ZSH/oh-my-zsh.sh

# General environment stuff 
export PATH=${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/python:${PATH}

case `uname` in
    Darwin)
        export EDITOR='mvim -f -c "au VimLeave * !open -a iTerm"'
        ;;
    *)
        export EDITOR=vim;
        ;;
esac

# Python stuff
export WORKON_HOME="${HOME}/lib/virtualenvs"
export PROJECT_HOME="${HOME}/Dropbox/projects"
export VEW_PATH="/usr/local/share/python/virtualenvwrapper.sh"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# # cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

[[ -d $WORKON_HOME ]] || mkdir -p $WORKON_HOME
source $VEW_PATH
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Java stuff
export JAVA_HOME=$(/usr/libexec/java_home)

# Aliases
alias ls='ls -FG'
