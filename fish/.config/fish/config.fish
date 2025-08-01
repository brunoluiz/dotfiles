if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Load mise environment (binary version management)
mise activate fish | source

# Load prompt/PS1 engine
starship init fish | source

# Added by LM Studio CLI (lms)
fish_add_path /Users/brunoluiz/.lmstudio/bin

# Load aliases
. ~/.bash_aliases

# Load bash colours
tinty apply base16-dracula

# Load z
zoxide init fish | source
