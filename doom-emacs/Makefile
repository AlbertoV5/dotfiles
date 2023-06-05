# Install all doom emacs requirements for init.el
# Requirements: XCode, Brew.

.PHONY: all
all: test emacs vterm lookup org ripgrep latex

test:
	brew --version > t.txt
emacs:
	brew install --cask emacs
vterm:
	brew install libvterm CMake
lookup:
	brew install ripgrep wordnet sqlite
org:
	brew install gnuplot
ripgrep:
	brew install ripgrep
hugo:
	brew install hugo
pandoc:
	brew install pandoc
latex:
	brew install --cask mactex
# https://docs.doomemacs.org/latest/modules/tools/magit/
# pip install pyright

doom:
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d && ~/.emacs.d/bin/doom install

dotfiles:
	cp ./init.el ~/.doom.d/init.el
	cp ./config.el ~/.doom.d/config.el
	cp ./packages.el ~/.doom.d/packages.el
	cp ./custom.el ~/.doom.d/custom.el
	cp -r ./themes ~/.doom.d/themes
	
# export PATH="$HOME/.emacs.d/bin:$PATH"

.PHONY: clean
clean:
	rm t.txt all