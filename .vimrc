set nocompatible "all options avialable in vim and vi at same time  will use vim mode. because certain commands are same in vi and vim , but vim way is better

filetype on
filetype indent on
filetype plugin on
call pathogen#infect()

syntax enable
let mapleader = ","
colorscheme xoria256

"Search customization
set incsearch  "shows results as you search
set ignorecase "ignore case while searching
set hlsearch "highlights all matched results
set smartcase "will perform case insensitive search until it encounters a capital letter

" Disable highlighting after search. Too distracting.
set nohlsearch

"Indentation
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab	
set autoindent 

set wildmenu 

"improving backspace and delete
set backspace=indent,eol,start


"improving readibility
set number
set showmatch "highlights ( { [ etc

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

"Buffers setting
set hidden "this will suppress errors incase i switch to next buffer without saving current one

"nmap <leader>l :set list!<CR> "mapping to toggle displaying  special characters

"Bubbling part of code up and down using timpope unimpaired plugin
"Moving single line of code up and down in normal mode
nmap <C-k> [e
nmap <C-j> ]e
"Moving multiple selected lines up and down
vmap <C-k> [egv
vmap <C-j> ]egv

