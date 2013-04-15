"behave as vim not vi
set nocompatible 

"loads all my plugins from bundle folder
call pathogen#infect()

"generate documentation from installed plugins
call pathogen#helptags()

filetype on
filetype indent on
filetype plugin on

syntax enable

"my fav color scheme
colorscheme xoria256

set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)

"hides menu bar and toolbar in gvim 

set guioptions=acg 

"Disable cursor blink 
set gcr=a:blinkon0              

"shows results as you search 
set incsearch  

"ignore case while searching 
set ignorecase 

"highlights all matched results 
set hlsearch 

"will perform case insensitive search until it encounters a capital letter 
set smartcase 

"wraps line after they hit end
set wrapscan

 " don't update the display while executing macros 
set lazyredraw                  

"it will set virtual edit allowing u to move around invalid places 
set virtualedit=all 

"Indentation
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab	
set autoindent 
set smartindent 

"in command line when tab is pressed show all matching commands
set wildmenu 

" Do not require exact case for completion 
set wildignorecase  

" remember more commands and search history 
set history=1000                

" use many muchos levels of undo 
set undolevels=1000             

"improving backspace and delete
set backspace=indent,eol,start

"show line number
set number

"treats numbers as decimal when incremeting and decrementing using <C-a> and
"<C-x>
set nrformats=

"splitting a window will put the new window below current one
set splitbelow

"splitting will cause new window to right of current one
set splitright

"show the cursor position in status bar
set ruler

"always show status bar
set laststatus=2

 "highlights ( { [ etc 
set showmatch 

 " Set the status line the way i like it
"set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" Status line
set laststatus=2
set statusline=
set statusline+=Buf:#%n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
    set statusline+=%{fugitive#statusline()}        " git status
endif
if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
    set statusline+=%{SyntasticStatuslineFlag()}    " syntastic status - makes sense with :Errors
endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position


" Resize splits when the window is resized
au VimResized * :wincmd =


" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END


 " makes the current directory as pwd 
set autochdir   

 " if files is changed locally load it immediately 
set autoread	

"nerd tree plugin customization
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"modifying window feature
"set winwidth=80
"set winheight=20    
"set winminheight=15
"set winheight=999 "to max

 "this keeps cursor 2 line below or top as we move  
set scrolloff=2 

" Add ignorance of whitespace to diff
set diffopt+=iwhite


"to enter Unicode character go in insert mode press ctrl-v and type the unicode character
"ctrl-v u00ac represents ¬
"ctrl-v u25b8 represents ▸
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set listchars=eol:¬

"will highlight line on which cursor is present
set cursorline

"this will make cursor line to be visible only on current line
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

"this will suppress errors incase i switch to next buffer without saving current one 
set hidden 

"show auto-complete menu even for single match
set completeopt=menu,menuone
                    
"this will set command height to 2
set ch=2

"my custom mappings 

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

"indent code with visual mode intact
vmap > >gv
vmap < <gv

"set leader key as single quote
let mapleader=','

 " Turn off highlight search 
nnoremap <leader>n :nohls<CR>

 "mapping to toggle displaying  special characters 
nnoremap <leader>l :set list!<CR> 

nnoremap <silent> <leader>s :set spell!<CR>
"to save file in insert mode and switch to command
inoremap <C-s> <esc>:w<CR> 

nnoremap <leader>b :BufExplorer<CR>

nnoremap <leader>f :CtrlP<CR>

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>h :TagbarToggle<CR>
nnoremap <leader>g :GundoToggle<CR>

nnoremap <tab> <C-w>w

nnoremap <S-tab> :tabnext<CR>

" Edit the vimrc file
nmap <silent> <leader>ev :vert split $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" use - and + to resize horizontal splits
noremap <M-s>  <C-W>-
noremap <M-w>  <C-W>+

" and for vsplits with alt-< or alt->
noremap <M-a> <C-W>>
noremap <M-d> <C-W><

"use M-q instead of esc to go to command mode
inoremap <M-q> <esc>
noremap <M-q> <esc>

"----------------------------------------------------------------
"Bubbling part of code up and down using timpope unimpaired plugin

"Moving single line of code up and down in normal mode
"M - for alt key, C - for Ctrl key, S - for Shift key
nmap <M-k> [e
nmap <M-j> ]e

"Moving multiple selected lines up and down
vmap <M-k> [egv
vmap <M-j> ]egv

" disable arrow keys
   map <up> <nop>
   map <down> <nop>
   map <left> <nop>
   map <right> <nop>
   imap <up> <nop>
   imap <down> <nop>
   imap <left> <nop>
   imap <right> <nop>
"----------------------------------------------------------------

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
"Snipmate

let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['js'] = 'javascript'


" Syntastic 
    
   " On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html'] }
    
" To enable this plugin, edit the .vimrc like this:
let g:syntastic_javascript_checker = "closurecompiler" 
" and set the path to the Google Closure Compiler:
   let g:syntastic_javascript_closure_compiler_path = '~/.vim/closure-compiler/compiler.jar'

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
 let g:syntastic_enable_signs=1
 "let g:syntastic_echo_current_error=1
 let g:syntastic_auto_loc_list=1

"Tagbar
  nnoremap <silent> <leader>tt :TagbarToggle<CR>

" Tabularize

if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<cr>
  vmap <leader>a= :Tabularize /=<cr>
  nmap <leader>a: :Tabularize /:\zs<cr>
  vmap <leader>a: :Tabularize /:\zs<cr>
endif


inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
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
iab Deffered Deferred
