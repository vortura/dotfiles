ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vortura"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git osx pip vagrant)

source $ZSH/oh-my-zsh.sh

# General environment stuff 
export PATH=${HOME}/bin:/usr/local/share/python:/usr/local/sbin:/usr/local/bin:${PATH}

case `uname` in
    Darwin)
        export EDITOR='mvim -f -c "au VimLeave * !open -a Terminal"'
        ;;
    *)
        export EDITOR=vim;
        ;;
esac

# Python stuff
export WORKON_HOME="${HOME}/lib/virtualenvs"
export VEW_PATH="/usr/local/share/python/virtualenvwrapper.sh"

[[ -d $WORKON_HOME ]] || mkdir -p $WORKON_HOME
source $VEW_PATH
export VIRTUAL_ENV_DISABLE_PROMPT=1
