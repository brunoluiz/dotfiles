# Install antigen if not installed
if [ ! -f "$HOME/.antigen.zsh" ]; then
  curl -L git.io/antigen > $HOME/.antigen.zsh
fi

# Initialize antigen and zsh stuff
source $HOME/.antigen.zsh
CASE_SENSITIVE="true"

antigen use oh-my-zsh
antigen bundle git
antigen bundle screen
antigen bundle osx
antigen bundle jsontools
antigen bundle git-extras
antigen bundle common-aliases
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen theme robbyrussell

antigen apply

# Default exports
export DEFAULT_USER="$(whoami)"
export BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Useful functions

# Confirm command to be executed
confirm() {
  echo -n "Do you want to run $*? [N/yes] "
  read REPLY

  # if test "$REPLY" = "y" -o "$REPLY" = "Y"; then
  if test "$REPLY" = "yes"; then
    echo -n "Countdown for execution: "
    echo -n "3..."
    sleep 1s
    echo -n "2..."
    sleep 1s
    echo "1..."
    sleep 1s

    "$@"
  else
      echo "Cancelled by user"
  fi
}

# Decode base64
d_base64 () {
  echo "$1" | base64 --decode ;
}

# Encode base64
e_base64 () {
  echo "$1" | base64 ;
}

# Load specifics for the machine
source $HOME/.zshrc.local
