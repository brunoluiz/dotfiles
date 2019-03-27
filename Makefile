backup:
	@mv ~/.vimrc ~/.vimrc.bak
	@mv ~/.tmux.conf ~/.tmux.conf.bak
	@mv ~/.zshrc ~/.zshrc.conf.bak
	@mv ~/.editorconfig ~/.editorconfig.bak
	@mv ~/.npmrc ~/.npmrc.bak
	@mv ~/.gitconfig ~/.gitconfig.bak

install: backup
	@echo '🚦 Installing configs...'
	@cp ./.vimrc ~/.vimrc
	@cp ./.tmux.conf ~/.tmux.conf
	@cp ./.zshrc ~/.zshrc
	@cp ./.editorconfig ~/.editorconfig
	@cp ./.npmrc ~/.npmrc
	@cp ./.gitconfig ~/.gitconfig
	@echo '❗️ Installed! Special requirements:'
	@echo '- Tmux: use prefix + I to install plugins'
	@echo '- Vim: use :PlugInstall to install plugins'

install-lean:
	@echo '🚦 Installing configs...'
	@cp ./.vimrc ~/.vimrc
	@cp ./.tmux.conf ~/.tmux.conf
	@cp ./.zshrc ~/.zshrc
	@cp ./.editorconfig ~/.editorconfig
	@echo '❗️ Installed! Special requirements:'
	@echo '- Tmux: use prefix + I to install plugins'
	@echo '- Vim: use :PlugInstall to install plugins'
