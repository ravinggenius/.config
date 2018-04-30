function t --wraps=exa
	exa --classify --git --git-ignore --group-directories-first --ignore-glob .git --tree $argv
end
