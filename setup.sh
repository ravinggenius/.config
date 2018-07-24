#!/usr/bin/env bash

echo "Installing package manager..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Improving shell..."
brew install fish

echo "Installing common utilities..."
brew install \
	exa \
	fzf \
	httpie \
	jq \
	jsonpp \
	ripgrep

echo "Installing recent git..."
brew install \
	git \
	tig

echo "Installing editors..."
brew install \
	kakoune \
	neovim

echo "Installing languages..."
brew install \
	crystal \
	node \
	rbenv \
	ruby-build

echo "Installing video downloaders..."
brew install \
	vimeo-downloader \
	you-get \
	youtube-dl

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

echo "Installing plugin manager for neovim..."
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/vendor
rm installer.sh
nvim --cmd 'call dein#install()'

echo "Swim with the fishes..."
chsh -s `which fish`

echo "All done. Restart your terminal to apply the changes"
