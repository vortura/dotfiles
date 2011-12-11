ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vortura"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git osx vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/richard/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/python:$PATH

case `uname` in
    Darwin)
        export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
        ;;
    *)
        export EDITOR=vim;
        ;;
esac
