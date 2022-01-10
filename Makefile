install:
	@echo '🚦 Installing configs...'
	-@cp ./.vimrc ~/.vimrc
	-@cp ./.tmux.conf ~/.tmux.conf
	-@cp ./.zshrc ~/.zshrc
	-@cp ./.editorconfig ~/.editorconfig
	-@cp ./.gitconfig ~/.gitconfig
	-@mkdir -p ~/.config/kitty
	-@cp ./.gitattributes ~/.gitattributes
	-@cp ./kitty.conf ~/.config/kitty/kitty.conf
	@echo '❗️ Installed! Special requirements:'
	@echo '- Tmux: use prefix + I to install plugins'
	@echo '- Vim: use :PlugInstall to install plugins'
