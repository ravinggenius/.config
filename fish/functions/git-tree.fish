function git-tree --wraps=exa
	exa --all --git-ignore --ignore-glob .git --tree $argv
end
