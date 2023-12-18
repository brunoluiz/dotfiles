# Some packages might need manual stowing due to potential conflicts OR credentials
stow:
	-@stow --verbose --target ~ --dir $(shell pwd) --stow _general
	-@stow --verbose --target ~ --dir $(shell pwd) --stow fonts
	-@stow --verbose --target ~ --dir $(shell pwd) --stow git
	mkdir -p .config/kitty
	-@stow --verbose --target ~ --dir $(shell pwd) --stow kitty
	-@stow --verbose --target ~ --dir $(shell pwd) --stow tmux
	mkdir -p .config/nvim
	-@stow --verbose --target ~ --dir $(shell pwd) --stow vim
	touch ~/.zshrc.local
	-@stow --verbose --target ~ --dir $(shell pwd) --stow zsh
	-@stow --verbose --target ~ --dir $(shell pwd) --stow node # Can be dangerous due to credentials
	mkdir .ssh
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/*

install:
	./macos.sh
