# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.krew/bin:/usr/local/bin:$PATH

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
# Disable autocorrect, to stop the annyoing zsh error with kubectl krew
unsetopt correct_all

#export PROMPT='[%n]%d %# ~'
export PROMPT='%(?.%F{green}√.%F{red}?%?)%f[%n] %F{240}%2~%f %#~> '

# Setting aliases.
alias code='cd /Users/behzad.dastur/code'
alias privnotes='cd /Users/behzad.dastur/code/privnotes_jul21/privnotes'

alias py38='source /Users/behzad.dastur/code/pyenvs/py38/bin/activate'
alias vim82="/usr/local/Cellar/vim/8.2.3075/bin/vim"
alias vii="/usr/local/Cellar/vim/8.2.3075/bin/vim"


function setAWSAutoComplete() {
    autoload bashcompinit && bashcompinit
    autoload -Uz compinit && compinit
    compinit
    complete -C  '/Users/behzad.dastur/code/pyenvs/py38/bin/aws_completer' aws
}

setAWSAutoComplete


