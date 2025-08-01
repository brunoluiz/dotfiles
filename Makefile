# Some packages might need manual stowing due to potential conflicts OR credentials
stow:
	@mkdir -p ~/.config/fish
	@mkdir -p ~/.config/ghostty
	@mkdir -p ~/.config/mise
	@mkdir -p ~/.config/nvim
	@mkdir -p ~/.ssh
	-@stow --verbose --target ~ --dir $(shell pwd) --stow _general --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow fish --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow ghostty --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow git --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow mise --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow node # Can be dangerous due to credentials
	-@stow --verbose --target ~ --dir $(shell pwd) --stow nvim --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow sqlite --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow ssh --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow starship --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow tmux --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow wezterm --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --stow zsh --adopt
	-@chmod 700 ~/.ssh
	-@chmod 600 ~/.ssh/*
	@echo '✅ Successfully set up stow'

unstow:
	-@stow --verbose --target ~ --dir $(shell pwd) --delete _general
	-@stow --verbose --target ~ --dir $(shell pwd) --delete fish --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --delete ghostty --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --delete git
	-@stow --verbose --target ~ --dir $(shell pwd) --delete mise
	-@stow --verbose --target ~ --dir $(shell pwd) --delete nvim --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --delete ssh --adopt
	-@stow --verbose --target ~ --dir $(shell pwd) --delete starship
	-@stow --verbose --target ~ --dir $(shell pwd) --delete tmux
	-@stow --verbose --target ~ --dir $(shell pwd) --delete wezterm
	-@stow --verbose --target ~ --dir $(shell pwd) --delete zsh

macos:
	./macos.sh

mise:
	mise install

install: macos stow mise
