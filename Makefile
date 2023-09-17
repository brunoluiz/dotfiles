STOW_PACKAGES = $(shell ls -d */ | sed 's/\///g')
stow:
	-@stow --adopt --verbose --target ~ --dir $(shell pwd) --stow $(STOW_PACKAGES)
	@echo 'Stowed packages!'

install:
	./macos.sh
