function t --wraps=exa
	exa --git --git-ignore --ignore-glob .git --tree $argv
end
