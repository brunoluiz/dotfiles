fish_add_path $GOPATH/bin
fish_add_path /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
fish_add_path /Users/bruno.silva/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.krew/bin

set -x DEFAULT_USER "$(whoami)"
set -x CASE_SENSITIVE true
set -x DISABLE_UNTRACKED_FILES_DIRTY true
set -x GOPATH $HOME/go
set -x EDITOR nvim
set -x TERM xterm-256color # this seems to break k9s colours
set -x BASH_SILENCE_DEPRECATION_WARNING 1
set -x AWS_VAULT_PROMPT ykman
# set -x KUBECONFIG (find ~/.kube/clusters -type f | tr '\n' ':' | sed 's/:$//')
set -x SHELL fish
set -x fisher_path $HOME/.config/fisher
set -x GITHUB_TOKEN $(gh auth token)
