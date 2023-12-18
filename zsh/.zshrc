zmodload zsh/zprof

# Install antigen if not installed
if [ ! -f "$HOME/.antigen.zsh" ]; then
  curl -L git.io/antigen > $HOME/.antigen.zsh
fi

source $HOME/.antigen.zsh
CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
BASE16_SHELL_ENABLE_VARS=1

# Set-up pugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle macos
antigen bundle common-aliases
antigen bundle kubectl
antigen theme amuse
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
export BASE16_SHELL="$HOME/.config/base16-shell/"
[ ! -f "$BASE16_SHELL/profile_helper.sh" ] && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH=$PATH:/usr/local/opt/asdf/libexec/asdf.sh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/Users/bruno.silva/.local/bin
export PATH=$PATH:/opt/homebrew/bin
export EDITOR=nvim
export TERM=xterm-256color # this seems to break k9s colours
export BASH_SILENCE_DEPRECATION_WARNING=1

### Aliases

alias s='stern'
alias kns='kubens'
alias kcx='kubectx'
alias kaf='safe_kubectlapply'
alias kak='safe_kubectlapply_kustomize'
alias q='q -d ,'
alias vim='/opt/homebrew/bin/nvim'
alias vi='/opt/homebrew/bin/nvim'
alias tmux='tmux'
# alias kubectl="kubecolor"
alias tf='terraform'

### Local specifics
source $HOME/.zshrc.local

### kitty
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
alias python=/usr/bin/python3
alias gfu=git commit -m 'do' && ggp

ksenv() {
  kubectl get secret $@ -o go-template='{{range $k,$v := .data}}{{printf "%s=" $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
}

ksyaml() {
  kubectl get secret $@ -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
}

. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash"
. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

search_and_replace() {
  ag -0 -l $1 | xargs -0 sed -ri.bak -e "s/$1/$2/g"
}

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

PROMPT="$PROMPT"
