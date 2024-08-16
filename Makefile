# Some packages might need manual stowing due to potential conflicts OR credentials
stow:
	-@stow --verbose --target ~ --dir $(shell pwd) --stow _general
	-@stow --verbose --target ~ --dir $(shell pwd) --stow git
	-@stow --verbose --target ~ --dir $(shell pwd) --stow starship
	-@stow --verbose --target ~ --dir $(shell pwd) --stow tmux
	touch ~/.zshrc.local
	-@stow --verbose --target ~ --dir $(shell pwd) --stow zsh
	-@stow --verbose --target ~ --dir $(shell pwd) --stow wezterm
	# -@stow --verbose --target ~ --dir $(shell pwd) --stow node # Can be dangerous due to credentials
	mkdir -p .config/nvim
	-@stow --verbose --target ~ --dir $(shell pwd) --stow nvim
	mkdir -p .config/fish
	-@stow --verbose --target ~ --dir $(shell pwd) --stow fish
	mkdir .ssh
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/*

install:
	./macos.sh
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
