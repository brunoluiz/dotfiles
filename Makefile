dotfiles:
	-@mkdir -p ~/.config/kitty
	-@cp .* ~
	-@cp ./kitty.conf ~/.config/kitty/kitty.conf
	@echo 'Copied dotfiles!'
