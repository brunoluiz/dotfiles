backup:
	-@cp ~/.vimrc ~/.vimrc.bak
	-@cp ~/.tmux.conf ~/.tmux.conf.bak
	-@cp ~/.zshrc ~/.zshrc.conf.bak
	-@cp ~/.editorconfig ~/.editorconfig.bak
	-@cp ~/.npmrc ~/.npmrc.bak
	-@cp ~/.gitconfig ~/.gitconfig.bak
	-@cp ~/.gitattributes ~/.gitattributes.bak

install-complete: backup
	@echo '🚦 Installing configs...'
	@cp ./.vimrc ~/.vimrc
	@cp ./.tmux.conf ~/.tmux.conf
	@cp ./.zshrc ~/.zshrc
	@cp ./.editorconfig ~/.editorconfig
	@cp ./.npmrc ~/.npmrc
	@cp ./.gitconfig ~/.gitconfig
	@cp ./.gitattributes ~/.gitattributes
	@echo '❗️ Installed! Special requirements:'
	@echo '- Tmux: use prefix + I to install plugins'
	@echo '- Vim: use :PlugInstall to install plugins'

install: backup
	@echo '🚦 Installing configs...'
	-@cp ./.vimrc ~/.vimrc
	-@cp ./.tmux.conf ~/.tmux.conf
	-@cp ./.zshrc ~/.zshrc
	-@cp ./.editorconfig ~/.editorconfig
	-@cp ./.gitconfig ~/.gitconfig
	@brew install the_silver_searcher
	@echo '❗️ Installed! Special requirements:'
	@echo '- Tmux: use prefix + I to install plugins'
	@echo '- Vim: use :PlugInstall to install plugins'
