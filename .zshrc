### Antigen and plugins

# Install antigen if not installed
if [ ! -f "$HOME/.antigen.zsh" ]; then
  curl -L git.io/antigen > $HOME/.antigen.zsh
fi

source $HOME/.antigen.zsh
CASE_SENSITIVE="true"

# Set-up pugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle osx
antigen bundle git-extras
antigen bundle common-aliases
antigen bundle kubectl
antigen bundle lukechilds/zsh-nvm
antigen theme robbyrussell
# antigen bundle zsh-users/zsh-completions
# antigen bundle colored-man-pages
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle kube-ps1
# antigen bundle zsh-users/zsh-autosuggestions
antigen apply

### Useful functions

# Confirm command to be executed
confirm() {
  echo -n "\e[33mDo you want to run $*? [N/yes] \e[m"
  read REPLY

  # if test "$REPLY" = "y" -o "$REPLY" = "Y"; then
  if test "$REPLY" = "yes"; then
    "$@"
  else
      echo "Cancelled by user"
  fi
}

# Decode base64
dbase64 () {
  echo "$1" | base64 --decode ;
}

# Encode base64
ebase64 () {
  echo -n "$1" | base64 ;
}

notes () {
  cd ~/Dropbox/notes
  vim
}

# kubectl tricks
safe_kubectlapply() {
  context=$(kubectl config current-context)
  echo "Applying to $context"
  if [[ $@ == *$context* ]] ; then
    confirm kubectl apply -f "$@"
  else
    echo "\e[31mMismatch on context: $@ => $context\e[m"
  fi
}

safe_kubectlapply_kustomize() {
  context=$(kubectl config current-context)
  echo "Applying to $context"
  if [[ $@ == *$context* ]] ; then
    confirm kubectl apply -k "$@"
  else
    echo "\e[31mMismatch on context: $@ => $context\e[m"
  fi
}

### Variables

export DEFAULT_USER="$(whoami)"
export BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
export TERM=xterm-256color
export CIRCLE_SHA1=bsilva-local

### Aliases

alias s='stern'
alias kns='kubens'
alias kcx='kubectx'
alias kaf='safe_kubectlapply'
alias kak='safe_kubectlapply_kustomize'

### Local specifics
source $HOME/.zshrc.local