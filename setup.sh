#!/usr/bin/env bash

echo "Installing package manager..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Improving shell..."
brew install fish

echo "Installing common utilities..."
brew install \
	ccat \
	exa \
	fzf \
	httpie \
	jq \
	jsonpp \
	ripgrep \
	um
brew cask install \
	chalk \
	dash \
	dropbox \
	flycut \
	keybase \
	moom

echo "Installing recent git..."
brew install \
	git \
	interactive-rebase-tool \
	tig
brew cask install \
	diffmerge \
	gitup \
	rowanj-gitx \
	xit

echo "Installing editors..."
brew install \
	kakoune \
	neovim
brew cask install \
	atom \
	oni \
	sublime-text \
	visual-studio-code

echo "Installing languages..."
brew install \
	crystal \
	node \
	rbenv \
	ruby-build

echo "Installing media managers..."
brew install \
	vimeo-downloader \
	you-get \
	youtube-dl
brew cask install spotify

echo "Installing database tools..."
brew cask install \
	postgres \
	postico \
	valentina-studio

echo "Installing chat apps..."
brew cask install \
	discord \
	slack

echo "Installing better terminal emulators..."
brew cask install \
	hyper \
	iterm2

echo "Installing fonts..."
brew tap caskroom/fonts
brew cask install \
	font-fira-code \
	font-fira-mono

echo "Installing browsers..."
brew cask install \
	firefox \
	google-chrome

echo "Installing virtual machines..."
brew install docker
brew cask install \
	docker \
	vagrant \
	virtualbox \
	virtualbox-extension-pack

echo "Setting persistent variables..."
read -p 'git configuration name: ' git_name
read -p 'git configuration email: ' git_email

fish --command "set --export --universal GIT_AUTHOR_NAME     '${git_name}'"
fish --command "set --export --universal GIT_COMMITTER_NAME  '${git_name}'"
fish --command "set --export --universal GIT_AUTHOR_EMAIL    '${git_email}'"
fish --command "set --export --universal GIT_COMMITTER_EMAIL '${git_email}'"

if [[ -e ~/.gitconfig ]]; then
	echo "Moving ~/.gitconfig to ~/.config/git/config-$(date -u +%Y%m%d%H%M%S)"
	mv ~/.gitconfig ~/.config/git/config-$(date -u +%Y%m%d%H%M%S)
fi

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Installing plugin manager for neovim..."
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/vendor
rm installer.sh
nvim --cmd 'call dein#install()'

echo "Swim with the fishes..."
chsh -s `which fish`

echo "All done. Restart your terminal to apply the changes"
