# You can put these two commands in your local shell initialization script
# # e.g. ~/.bashrc or ~/.zhsrc
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nanotech"
# ZSH_THEME="gnzh"

# Example aliases
alias vi='nvim'
alias vim='nvim'
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias k=kubectl

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=5

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git git-flow git-extras gradle gitignore python pip history postgres scala sbt sudo urltools brew cp osx xcode docker battery docker-machine colored-man-pages vi-mode kubectl terraform helm)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:~/.local/bin"
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath=(/usr/local/share/oh-my-stups $fpath)

# enable autocomplete function
autoload -U compinit
compinit

# FZF 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
# export FZF_DEFAULT_COMMAND='ag %s -l -g "" --ignore "target/*"'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# OKTA AWS
#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/atubiono/.sdkman"
[[ -s "/Users/atubiono/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/atubiono/.sdkman/bin/sdkman-init.sh"


#KUBE PS1 - Extra info on propmt
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
export KUBE_PS1_PREFIX=''
export KUBE_PS1_SUFFIX=' >> '
export KUBE_PS1_SEPARATOR=' '
PS1='$(kube_ps1)'$PS1
