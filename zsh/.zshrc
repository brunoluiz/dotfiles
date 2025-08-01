# zsh: Enable profiler
zmodload zsh/zprof

# zsh: Basic settings
CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
BASE16_SHELL_ENABLE_VARS=1
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# Configure PS1 through starship
eval "$(starship init zsh)"

# Enable mise (similar to asdf, allow multiple versions of binaries)
eval "$(mise activate zsh)"

# Global variables
export DEFAULT_USER="$(whoami)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/Users/bruno.silva/.local/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"
export PATH="$PATH:/Users/brunoluiz/.lmstudio/bin"
export EDITOR=nvim
export PAGER=bat
export TERM=xterm-256color # this seems to break k9s colours
export BASH_SILENCE_DEPRECATION_WARNING=1

# Apply base16-dracula
tinty apply base16-dracula

# Local specifics
touch ~/.zshrc.local
source $HOME/.zshrc.local
source $HOME/.bash_aliases
