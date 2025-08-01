# zsh: Enable profiler
zmodload zsh/zprof

# zsh: Start antigen (plugin manager)
[ ! -f "$HOME/.antigen.zsh" ] && (curl -L git.io/antigen > $HOME/.antigen.zsh)
source $HOME/.antigen.zsh

# zsh: Basic settings
CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
BASE16_SHELL_ENABLE_VARS=1
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# zsh: Set-up pugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle macos
antigen bundle common-aliases
antigen bundle kubectl
antigen bundle jeffreytse/zsh-vi-mode
antigen theme amuse
antigen apply

# Configure PS1 through starship
eval "$(starship init zsh)"

# Enable mise (similar to asdf, allow multiple versions of binaries)
eval "$(mise activate zsh)"

# Global variables
export DEFAULT_USER="$(whoami)"
export BASE16_SHELL="$HOME/.config/base16-shell/"
[ ! -f "$BASE16_SHELL/profile_helper.sh" ] && git clone https://github.com/tinted-theming/base16-shell ~/.config/base16-shell
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/Users/bruno.silva/.local/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"
export EDITOR=nvim
export PAGER=bat
export TERM=xterm-256color # this seems to break k9s colours
export BASH_SILENCE_DEPRECATION_WARNING=1

# Aliases
alias cat=bat
alias cd=z # does not work?
alias k=kubectl
alias kaf='safe_kubectlapply'
alias kak='safe_kubectlapply_kustomize'
alias kcx=kubectx
alias kns=kubens
alias less=bat
alias ls=lsd
alias ps=procs
alias q='q -d ,'
alias s='stern'
alias tf=terraform
alias tmux='tmux'
alias vi='/opt/homebrew/bin/nvim'
alias vi=/opt/homebrew/bin/nvim
alias vim='/opt/homebrew/bin/nvim'
alias vim=/opt/homebrew/bin/nvim

# Local specifics
source $HOME/.zshrc.local

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/brunoluiz/.lmstudio/bin"
# End of LM Studio CLI section

