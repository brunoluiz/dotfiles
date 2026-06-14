# Some packages might need manual setup due to potential conflicts OR credentials
chezmoi:
	@chezmoi apply
	@chmod 700 ~/.ssh
	@chmod 600 ~/.ssh/*
	@echo 'Successfully set up chezmoi'

macos:
	./macos.sh

mise:
	mise install

install: macos chezmoi mise

clean:
	brew cleanup -s
	docker system prune
