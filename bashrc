export PATH=~/bin:/usr/local/sbin:/usr/local/bin:$PATH
export HISTCONTROL=ignoreboth

D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

export PS1='\n${PINK}\u ${D}at ${ORANGE}\h ${D}in ${GREEN}\w$\
${D}\n$ '

export CLICOLOR=1

alias db='cd ~/Dropbox'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
