# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/behzad.dastur/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# plugins=(git)

source $ZSH/oh-my-zsh.sh

####################################################################
# User configuration
####################################################################
export PROMPT='[%n]%d %# ~'

# Setting aliases.
alias py38='source /Users/behzad.dastur/code/pyenvs/py38/bin/activate'
alias code='cd /Users/behzad.dastur/code'


function setAWSAutoComplete() {
    autoload bashcompinit && bashcompinit
    autoload -Uz compinit && compinit
    compinit
    complete -C  '/Users/behzad.dastur/code/pyenvs/py38/bin/aws_completer' aws
}

setAWSAutoComplete


