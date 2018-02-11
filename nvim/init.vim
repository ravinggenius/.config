if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/vendor/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/vendor')
  call dein#begin('~/.config/nvim/vendor')

  " Let dein manage dein
  call dein#add('~/.config/nvim/vendor/repos/github.com/Shougo/dein.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
