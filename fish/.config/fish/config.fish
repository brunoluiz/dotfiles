if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Load mise environment (binary version management)
mise activate fish | source

# Load prompt/PS1 engine
starship init fish | source

# Load z
zoxide init fish | source

# Load bash colours
tinty apply base16-materia
