# Disable greeting
set -g fish_greeting

# Commands to run in interactive sessions can go here
if status is-interactive
end

# Load mise environment (binary version management)
mise activate fish | source

# Load prompt/PS1 engine
starship init fish | source

# Load z
zoxide init fish | source

# Load bash colours
tinty apply base16-materia

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/brunoluiz/.lmstudio/bin
# End of LM Studio CLI section

