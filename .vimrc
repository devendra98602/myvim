set nocompatible "all options avialable in vim and vi at same time  will use vim mode. because certain commands are same in vi and vim , but vim way is better

filetype on
filetype indent on
filetype plugin on
call pathogen#infect()

let mapleader = ","
colorscheme desert

"Search customization
set incsearch  "shows results as you search
set ignorecase "ignore case while searching
set hlsearch "highlights all matched results
set smartcase "will perform case insensitive search until it encounters a capital letter

"Indentation
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab	
set autoindent 

"improving backspace and delete
set backspace=indent,eol,start


"improving readibility
set number
set showmatch "highlights ( { [ etc
syntax enable

set autochdir   " makes the current directory as pwd
set autoread	" if files is changed locally load it immediately
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"modifying window feature
"set winwidth=80
"set winheight=20    
"set winminheight=15
"set winheight=999 "to max

"set list "will show special characters as tab and enter

"to enter unicode character go in insert mode press ctrl-v and type the unicode character
"ctrl-v u00ac represents ¬
"ctrl-v u25b8 represents ▸
set listchars=tab:▸\ ,eol:¬
set cursorline

"nmap <leader>l :set list!<CR> "mapping to toggle displaying  special characters
