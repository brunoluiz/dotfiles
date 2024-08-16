if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Load mise environment (binary version management)
~/.local/bin/mise activate fish | source

# Load prompt/PS1 engine
starship init fish | source

# Set path to fisher plugins
set -xg fisher_path $HOME/.config/fisher

# Load fisher plugins
source $HOME/.config/fish/conf.d/fisher.fish
