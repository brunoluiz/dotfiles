# Some packages might need manual stowing due to potential conflicts OR credentials
stow:
	-@stow --verbose --target ~ --dir $(shell pwd) --stow _general
	-@stow --verbose --target ~ --dir $(shell pwd) --stow fonts
	-@stow --verbose --target ~ --dir $(shell pwd) --stow git
	-@stow --verbose --target ~ --dir $(shell pwd) --stow starship
	mkdir -p .config/kitty
	-@stow --verbose --target ~ --dir $(shell pwd) --stow kitty
	-@stow --verbose --target ~ --dir $(shell pwd) --stow tmux
	touch ~/.zshrc.local
	-@stow --verbose --target ~ --dir $(shell pwd) --stow zsh
	-@stow --verbose --target ~ --dir $(shell pwd) --stow wezterm
	# -@stow --verbose --target ~ --dir $(shell pwd) --stow node # Can be dangerous due to credentials
	mkdir -p .config/nvim
	-@stow --verbose --target ~ --dir $(shell pwd) --stow nvim
	mkdir .ssh
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/*

install:
	./macos.sh
