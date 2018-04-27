function c --wraps=(cd ~/Code)
	# builtin cd ~/Code/$argv
	cd ~/Code/$argv
end
complete --command c --arguments '(__fish_complete_directories ~/Code/)'
