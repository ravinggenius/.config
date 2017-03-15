function tree --wraps /usr/local/bin/tree
	/usr/local/bin/tree -aACFI '.git|.hg|build|dist|node_modules|*.swp|*vendor*' $argv
end
