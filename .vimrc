set nocompatible "all options avialable in vim and vi at same time  will use vim mode. because certain commands are same in vi and vim , but vim way is better
call pathogen#infect()
filetype on
filetype indent on
filetype plugin on

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
"it will set virtual edit allowing u to move around invalid places 
set virtualedit=all 
"Indentation
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab	
set autoindent 
set smartindent 

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
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
set autochdir   " makes the current directory as pwd
set autoread	" if files is changed locally load it immediately
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"modifying window feature
"set winwidth=80
"set winheight=20    
"set winminheight=15
"set winheight=999 "to max

set scrolloff=2 "this keeps cursor 2 line below or top as we move 

"set list "will show special characters as tab and enter

"to enter Unicode character go in insert mode press ctrl-v and type the unicode character
"ctrl-v u00ac represents ¬
"ctrl-v u25b8 represents ▸
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set listchars=eol:¬
set cursorline

"this will make cursor line to be visible only on current line
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
"Buffers setting
set hidden "this will suppress errors incase i switch to next buffer without saving current one
nmap <silent> ,n :nohls<CR>" Turn off that stupid highlight search
nmap <leader>l :set list!<CR> "mapping to toggle displaying  special characters
nmap <silent> <leader>s :set spell!<CR>
"to save file in insert mode and switch to command
inoremap <C-s> <esc>:w<CR> 
nnoremap <leader>be :BufExplorer<CR>
"Bubbling part of code up and down using timpope unimpaired plugin
"Moving single line of code up and down in normal mode
nmap <C-k> [e
nmap <C-j> ]e
"Moving multiple selected lines up and down
vmap <C-k> [egv
vmap <C-j> ]egv
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Add ignorance of whitespace to diff
set diffopt+=iwhite

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
iab thsi this
iab yuor your
iab begining beginning
