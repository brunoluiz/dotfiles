# Some packages might need manual stowing due to potential conflicts OR credentials
stow:
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow _general
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow fonts
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow git
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow kitty
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow tmux
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow vim
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow zsh
	-@stow --verbose --target ~ --dir $(shell pwd) --stow node # Can be dangerous due to credentials

install:
	./macos.sh
