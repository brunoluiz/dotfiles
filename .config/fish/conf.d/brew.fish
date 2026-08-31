# Enable brew completions
if test -d /opt/homebrew/share/fish/completions
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

# Enable brew vendors completions
if test -d /opt/homebrew/share/fish/vendor_completions.d
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
