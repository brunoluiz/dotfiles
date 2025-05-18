# Some packages might need manual stowing due to potential conflicts OR credentials
stow:
	-@stow --verbose --target ~ --dir $(shell pwd) --stow _general --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow git --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow starship --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow tmux --adopt
	touch ~/.zshrc.local
	-@stow --verbose --target ~ --dir $(shell pwd) --stow zsh --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow wezterm --adopt
	# -@stow --verbose --target ~ --dir $(shell pwd) --stow node # Can be dangerous due to credentials
	mkdir -p ~/.config/nvim
	-@stow --verbose --target ~ --dir $(shell pwd) --stow nvim --adopt
	mkdir -p ~/.config/fish
	-@stow --verbose --target ~ --dir $(shell pwd) --stow fish --adopt
	mkdir -p ~/.config/ghostty
	-@stow --verbose --target ~ --dir $(shell pwd) --stow ghostty --adopt
	mkdir -p ~/.ssh
	-@chmod 700 ~/.ssh
	-@chmod 600 ~/.ssh/*
	-@stow --verbose --target ~ --dir $(shell pwd) --stow ssh --adopt

unstow:
	-@stow --verbose --target ~ --dir $(shell pwd) --delete _general
	-@stow --verbose --target ~ --dir $(shell pwd) --delete git
	-@stow --verbose --target ~ --dir $(shell pwd) --delete starship
	-@stow --verbose --target ~ --dir $(shell pwd) --delete tmux
	-@stow --verbose --target ~ --dir $(shell pwd) --delete zsh
	-@stow --verbose --target ~ --dir $(shell pwd) --delete wezterm
	-@stow --verbose --target ~ --dir $(shell pwd) --delete nvim --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --delete fish --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --delete ghostty --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --delete ssh --adopt

install:
	./macos.sh
