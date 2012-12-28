set nocompatible "all options avialable in vim and vi at same time  will use vim mode. because certain commands are same in vi and vim , but vim way is better

filetype on
filetype indent on
filetype plugin on
call pathogen#infect()

let mapleader = ","
colorscheme xoria256
set guioptions=acg "hides menu bar and toolbar in gvim
"Search customization
set incsearch  "shows results as you search
set ignorecase "ignore case while searching
set hlsearch "highlights all matched results
set smartcase "will perform case insensitive search until it encounters a capital letter
set wrapscan
" Disable highlighting after search. Too distracting.
set lazyredraw                  " don't update the display while executing macros

"Indentation
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab	
set autoindent 

set wildmenu 
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
"improving backspace and delete
set backspace=indent,eol,start


"improving readibility
set number
set gcr=a:blinkon0              "Disable cursor blink
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

"to enter Unicode character go in insert mode press ctrl-v and type the unicode character
"ctrl-v u00ac represents ¬
"ctrl-v u25b8 represents ▸
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set listchars=eol:¬
set cursorline

"Buffers setting
set hidden "this will suppress errors incase i switch to next buffer without saving current one
nmap <silent> ,n :nohls<CR>" Turn off that stupid highlight search
nmap <leader>l :set list!<CR> "mapping to toggle displaying  special characters
nmap <silent> <leader>s :set spell!<CR>

"Bubbling part of code up and down using timpope unimpaired plugin
"Moving single line of code up and down in normal mode
nmap <C-k> [e
nmap <C-j> ]e
"Moving multiple selected lines up and down
vmap <C-k> [egv
vmap <C-j> ]egv

"moving between tabs

"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------

iab Acheive Achieve
iab acheive achieve
iab Alos Also
iab alos also
iab Aslo Also
iab aslo also
iab Becuase Because
iab becuase because
iab Bianries Binaries
iab bianries binaries
iab Bianry Binary
iab bianry binary
iab Charcter Character
iab charcter character
iab Charcters Characters
iab charcters characters
iab Exmaple Example
iab exmaple example
iab Exmaples Examples
iab exmaples examples
iab Fone Phone
iab fone phone
iab Lifecycle Life-cycle
iab lifecycle life-cycle
iab Lifecycles Life-cycles
iab lifecycles life-cycles
iab Seperate Separate
iab seperate separate
iab Seureth Suereth
iab seureth suereth
iab Shoudl Should
iab shoudl should
iab Taht That
iab taht that
iab Teh The
iab teh the
iab fasle false

