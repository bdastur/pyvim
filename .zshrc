# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.krew/bin:/usr/bin:/usr/sbin:/usr/local/bin:/bin:$PATH

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


#-------------------------------------------------------------------
# Set command line prompt.
# (https://github.com/jonmosco/kube-ps1) - for Kubernetes prompt
# (devcluster:default)√[behzad.dastur] code/pytest %~>
#-------------------------------------------------------------------
#export KUBECONFIG="$HOME/.kube/prodconfig"
export KUBE_PS1_SYMBOL_ENABLE=false
source ~/tools/kube_ps1.sh
export PROMPT='%(?.%F{green}√.%F{red}?%?)%f[%n] %F{240}%2~%f %#~> '
export PROMPT='$(kube_ps1)'$PROMPT

# Setting aliases.
alias code='cd /Users/behzad.dastur/code'
alias privnotes='cd /Users/behzad.dastur/code/privnotes_jul21/privnotes'

alias py38='source /Users/behzad.dastur/code/pyenvs/py38/bin/activate'
alias vim82="/usr/local/Cellar/vim/8.2.3250/bin/vim"
alias vii="/usr/local/Cellar/vim/8.2.3250/bin/vim"


function setAWSAutoComplete() {
    autoload bashcompinit && bashcompinit
    autoload -Uz compinit && compinit
    compinit
    complete -C  '/Users/behzad.dastur/code/pyenvs/py38/bin/aws_completer' aws
}

setAWSAutoComplete

# Kubectl auto complete.
source <(kubectl completion zsh)

#-----------------------------------------------------------------
# Kubernetes/Kubectl helper utils.
#-----------------------------------------------------------------
function kcsetalias() {
    alias kc="kubectl --kubeconfig=$(pwd)/kubeconfig"
}

function kcsetenv() {
    export KUBECONFIG="$(pwd)/kubeconfig"
}

function kcgrafana() {
    pod_name=$(kubectl get pods -n acme-monitoring | grep grafana | awk -F" " '{print $1}')
    kubectl port-forward -n acme-monitoring grafana-55bd65c5c7-v89qg 3000:3000
}

function kchelp() {
    echo "Aliases:"
    echo "---------------------------------------------"
    echo "kcsetalias - Sets kc alias to point to kubeconfig in current dir"
    echo "kcsetenv   - Sets the KUBECONFIG env variable to kubeconfig in current dir"
    echo "kcgrafana  - Port-forward acme-monitoring ns grafana pod"
    echo ""
    echo "---------------------------------------------"
}

# Added by https://ghe.megaleo.com/INFServices/scripts/
export PATH=$PATH:$HOME/.local/bin
