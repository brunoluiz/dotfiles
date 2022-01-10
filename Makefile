install:
	@echo '🚦 Installing configs...'
	-@mkdir -p ~/.config/kitty
	-@cp ./.vimrc ~/.vimrc
	-@cp ./.tmux.conf ~/.tmux.conf
	-@cp ./.zshrc ~/.zshrc
	-@cp ./.editorconfig ~/.editorconfig
	-@cp ./.gitconfig ~/.gitconfig
	-@cp ./.gitattributes ~/.gitattributes
	-@cp ./kitty.conf ~/.config/kitty/kitty.conf
	@echo 'Installed!'
