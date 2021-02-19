"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          BASIC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" show line number
set number
"" show relative nubmer
set relativenumber

"" show button status
set ruler
"" show command key
"set showcmd

"" tap -> 4 spaces
set tabstop=4
"set softtabstop=4
set expandtab
set autoindent

"" backspace key can delete indent,eol,start
set backspace=indent,eol,start

"" syntax highlight
syntax on

"" file encoding
set fileencodings=utf-8,cp936
set fileencoding=utf-8
set encoding=utf-8
"set termencoding=utf-8

"" highlight search result
"set hlsearch
"" realtime search
set incsearch

"" autoread modified file 
set autoread

"" auto scroll
set scrolloff=5

colorscheme default

"" code folding
"set foldmethod=indent
"set foldlevel=99



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          CUSTOMER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Quickly Run
map ,,r :w<CR> :call CompileRunCode() <CR>
func! CompileRunCode()
    "exec 'w'
    if &filetype == 'python'
        exec '! python %'
        "exec '! /home/b1uea/environment/pyvenv/bin/python %'
    elseif &filetype == 'c'
        exec '!clang % -o %:r'
        exec '! %:r'
    elseif &filetype == 'groovy'
        exec '!groovy %'
    endif
endfunc


"" key map
"""" map the ctrl+w [hjkl] to ,[hjkl] ; change window
nnoremap ,h <C-W>h 
nnoremap ,j <C-W>j
nnoremap ,k <C-W>k 
nnoremap ,l <C-W>l 

"""" map the ctrl+w [HJKL] to ,[HJKL] ; move window
nnoremap ,H <C-W>H 
nnoremap ,J <C-W>J
nnoremap ,K <C-W>K 
nnoremap ,L <C-W>L 


"""" map the g[tT] to ,t[T] ; change tab
""""""" next tab
"nnoremap ,tn gt
noremap <C-tab> :tabnext<CR>
inoremap <C-tab> <ESC>:tabnext<CR>
""""""" previous tab
"nnoremap ,tp gT
noremap <C-S-tab> :tabprev<CR>
inoremap <C-S-tab> <ESC>:tabprev<CR>
""""""" new tab
noremap ,tt :tabnew<cr>
""""""" close tab
noremap ,tc :tabclose<cr>
"
"noremap ,we :Vexplore<CR>:vertical resize 30<CR>

"""" enable code folding with the ,<space> rather than zc
noremap ,<space> zc
noremap <space> zo

"""" copy (or cut) to system clipboard
"""""" cut
"nnoremap ,x  "+x
"""""" copy
noremap ,c  "+y
"""""" paste (put befote)
nnoremap ,v  "+gP
"""""" paste (put after)
nnoremap ,V  "+gp


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" gui config
if has("gui_running")
    "" hide menubar
    "set guioptions-=m
    
    "" hide toolbar
    set guioptions-=T
    
    "" set theme
    "colorscheme morning 
    "colorscheme evening
    "colorscheme desert
    "colorscheme blue
    colorscheme darkblue

    "" highlight the cursor line
    set cursorline
    
    "set columns=80
    
    "" set menu language to English
    source $VIMRUNTIME/delmenu.vim
    set langmenu=en_US
    source $VIMRUNTIME/menu.vim

    if has('gui_win32')
        " gui font and font size
        set guifont=Sarasa\ Term\ SC:h15
    else
        set guifont=DejaVu\ Sans\ Mono\ 16
    endif
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
    
    "" statu-bar
    Plug 'vim-airline/vim-airline'
    "" file tree
    Plug 'scrooloose/nerdtree' 
    "" color scheme
    Plug 'morhetz/gruvbox'
    "" quoting/parenthesizing made simple
    Plug 'tpope/vim-surround'
    "" formate code
    Plug 'chiel92/vim-autoformat'
    "" autocomplete 
    Plug 'davidhalter/jedi-vim'
    "" syntax check
    Plug 'w0rp/ale'
    
    "Plug 'valloric/youcompleteme'
    "" display-pane
    "Plug 't9md/vim-choosewin'
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plug-config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 1.NERDTree 
""
""   1.1 nerdtree key map
""
map ,n :NERDTreeToggle<CR>
""
""   1.2 open nerdtree automatically when vim start up if no files where specified
""
if has("gui_running")
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif
""
""   1.3 open nerdtree automatically when vim start up on opening a directory
""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
""
""   1.4 close vim if the only window left open is a NERDTree
""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""
""   1.5 change default arrows
""
"let g:NERDTreeDirArrowExpandable = '>' 
"let g:NERDTreeDirArrowCollapsible = '-'

"" 2. gruvbox
""
if has("gui_running")
    set bg=dark
    colorscheme gruvbox
    "let g:gruvbox_contrast_dark='hard'  
    let g:gruvbox_contrast_dark='soft'  
endif

"" 3. ale
""
""   3.1
""
"let g:ale_linters = {
"\   'python':['autopep8']
"\}
""
""   3.2 fix
""
let g:ale_fixers = {
\   'python':['autopep8']
\}
""
""   3.2 fix fiel when save the file
""
let g:ale_fix_on_save = 1

"" 4. vim-autoformat
let g:formatter_yapf_style = 'pep8'

"" 5. jedi
""
""   5.1
""
let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#force_py_version = 3.7

