if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/vendor/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/vendor')
  call dein#begin('~/.config/nvim/vendor')

  " Let dein manage dein
  call dein#add('~/.config/nvim/vendor/repos/github.com/Shougo/dein.vim')

  " GENERAL
  " {{{
    " Awesome mouse support in the terminal
    set mouse=a

    " Extended character information for character under the cursor
    " (press `ga`)
    call dein#add('tpope/vim-characterize')

    " Allow repeat (`.`) to work with vim-surround
    call dein#add('tpope/vim-repeat')

    " Statusline
    call dein#add('vim-airline/vim-airline')
    set noshowmode

    " Open splits where expected
    set splitbelow
    set splitright
  " }}}

  " EDITING
  " {{{
    " Respect project file formatting
    call dein#add('editorconfig/editorconfig-vim')
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']

    call dein#add('ervandew/supertab')
    set wildmenu
    set wildmode=list:longest,full

    " Align text
    call dein#add('godlygeek/tabular')

    " Add/edit/delete surrounding matching pairs
    call dein#add('tpope/vim-surround')

    call dein#add('mbbill/undotree')
    nnoremap <F5> :UndotreeToggle<CR>
    if has("persistent_undo")
      set undodir=~/.config/nvim/undo/
      set undofile
    endif
  " }}}

  " GIT
  " {{{
    call dein#add('airblade/vim-gitgutter')

    call dein#add('jreybert/vimagit')

    call dein#add('tpope/vim-fugitive')
  " }}}

  " LINE DECORATIONS
  " {{{
    " Turn on line numbering
    set number

    " Width reserved for line numbers
    set numberwidth=4

    " Relative numbering in NORMAL mode
    " Absolute numbering in INSERT mode
    call dein#add('myusuf3/numbers.vim')
    nnoremap <F3> :NumbersToggle<CR>

    " Mark long lines
    set colorcolumn=80

    " Highlight current line
    set cursorline
  " }}}

  " QUICK OPEN
  " {{{
    call dein#add('kien/ctrlp.vim')
    let g:ctrlp_working_path_mode = 2
  " }}}

  " SEARCHING
  " {{{
    " Incremental search with ignore case (except explicit caps)
    set incsearch
    set ignorecase
    set smartcase
    set showmatch
    set hlsearch

    " Clear search highlighting
    nnoremap <leader><space> :noh<cr>

    " Search highlighting
    set hls

    " Center search results while browsing
    map N Nzz
    map n nzz
  " }}}

  " SQL
  " {{{
    call dein#add('tpope/vim-db')
  " }}}

  " CSS, SCSS
  " {{{
    call dein#add('ap/vim-css-color')

    call dein#add('miripiruni/CSScomb-for-Vim')
    autocmd BufWritePre,FileWritePre *.css,*.less,*.sass,*.scss silent! :CSScomb
  " }}}

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
