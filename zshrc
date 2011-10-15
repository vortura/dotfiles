ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vortura"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git osx vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/richard/bin:/usr/local/sbin:/usr/local/bin:$PATH

case `uname` in
    Darwin)
        export EDITOR=mvim;
        ;;
    *)
        export EDITOR=vim;
        ;;
esac
