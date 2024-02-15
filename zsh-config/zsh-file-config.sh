# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  vi-mode
  terraform
  kubectl
  kubectx
  copypath
  docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
ZSH_THEME="miloshadzic"
echo '\e[5 q'

alias la='ls -a'
alias ll='ls -l'
alias rm='rm -rf'


alias g='git'
alias gb='git branch -a'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias gpull='git pull --all'
alias gcl='git clone'
alias gl='git log'

alias gt='git stash'
alias gtl='git stash list'
alias gtp='git stash list'

alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dps='docker ps'
alias dl='docker logs'
alias ddi='docker rmi -f $(docker images -aq)'
alias ddc='docker rm -f $(docker ps -aq)'
alias dr='docker run -it'
alias de='docker exec -it'
alias dsp='docker system prune -a'


alias s3='aws s3 ls'

alias twl='terraform workspace list'
alias tws='terraform workspace select'
alias ti='terraform init'
alias tp='terraform plan'
alias ta='terraform apply'
alias tpt='terraform plan -target'

### ============KUBERNETES =====================
alias k='kubectl'
alias kb='kubens'
alias kgns='kubectl get ns'
alias kx='kubectx'

alias kgn='kubectl get no'
alias kgnw='kubectl get no -o wide'

alias ka='kubectl apply -f'

alias kga='kubectl get all'

alias ke='kubectl exec -it'

alias kl='kubectl logs'

## Pod
alias kgp='kubectl get po'
alias kgpy='kubectl get pod -o yaml'
alias kdp='kubectl describe pod'
alias kep='kubectl edit pod'
alias kdelp='kubectl delete pod'

## Service
alias kgs='kubectl get svc'
alias kgsy='kubectl get svc -o yaml'
alias kds='kubectl describe svc'
alias kes='kubectl edit svc'
alias kdels='kubectl delete svc'

## Ingress
alias kgi='kubectl get ing'
alias kgiy='kubectl get ing -o yaml'
alias kdi='kubectl describe ing'
alias kei='kubectl edit ing'
alias kdeli='kubectl delete ing'

## deployment
alias kgd='kubectl get deploy'
alias kgdy='kubectl get deploy -o yaml'
alias kdd='kubectl describe deploy'
alias ked='kubectl edit deploy'
alias kdeld='kubectl delete deploy'

## Namespace
alias kcn='kubectl create ns'
alias kdn='kubectl delete ns'

## ConfigMap
alias kgcm='kubectl get cm'
alias kgcmy='kubectl get cm -o yaml'
alias kicm='kubectl edit cm'
alias kdcm='kubectl describe cm'
alias kdelcm='kubectl delete cm'

## Pod distribution budget
alias kgpdb='kubectl get pdb'

## Demonset
alias kgds='kubectl get ds'
alias kgdsy='kubectl get ds -o yaml'
alias kids='kubectl edit ds'
alias kdds='kubectl describe ds'
alias kdelds='kubectl delete ds'

## RoleBingAccessControl
alias kgrbac='kubectl get rbac'
alias kgrbacy='kubectl get rbac -o yaml'
alias kirbac='kubectl edit rbac'
alias kdrbac='kubectl describe rbac'
alias kdelrbac='kubectl delete rbac'

## RoleBingAccessControl
alias kgrbac='kubectl get rbac'
alias kgrbacy='kubectl get rbac -o yaml'
alias kirbac='kubectl edit rbac'
alias kdrbac='kubectl describe rbac'
alias kdelrbac='kubectl delete rbac'

## Role
alias kgr='kubectl get r'
alias kgry='kubectl get r -o yaml'
alias kir='kubectl edit r'
alias kdr='kubectl describe r'
alias kdelr='kubectl delete r'

## RoleBinding
alias kgrb='kubectl get rb'
alias kgrby='kubectl get rb -o yaml'
alias kirb='kubectl edit rb'
alias kdrb='kubectl describe rb'
alias kdelrb='kubectl delete rb'

## ClusterRole
alias kgcr='kubectl get cr'
alias kgcry='kubectl get cr -o yaml'
alias kicr='kubectl edit cr'
alias kdcr='kubectl describe cr'
alias kdelcr='kubectl delete cr'

## ClusterRoleBinding
alias kgcrb='kubectl get crb'
alias kgcrby='kubectl get crb -o yaml'
alias kicrb='kubectl edit crb'
alias kdcrb='kubectl describe crb'
alias kdelcrb='kubectl delete crb'

## Statefulset
alias kgsts='kubectl get sts'
alias kgstsy='kubectl get sts -o yaml'
alias kists='kubectl edit sts'
alias kdsts='kubectl describe sts'
alias kdelsts='kubectl delete sts'

## Storage
alias kgsc='kubectl get sc'
alias kgpv='kubectl get pv'
alias kgpvc='kubectl get pvc'


### ============ HELM=====================
alias h2='helm'
alias h3='helm3'

alias s1="ssh -i ~/keys/terraform-azure.pem azureuser@server1.anomicatech.com"
alias s2="ssh -i ~/keys/terraform-azure.pem azureuser@server2.anomicatech.com"
alias s3="ssh -i ~/keys/terraform-azure.pem azureuser@server3.anomicatech.com"
alias s4="ssh -i ~/keys/terraform-azure.pem azureuser@server4.anomicatech.com"
alias s8="ssh tia@server4.anomicatech.com"

alias p="bash ~/code/automation-scripts/git.sh"
alias clean="bash ~/code/automation-scripts/clean.sh"
alias status="bash ~/code/automation-scripts/git-status.sh"