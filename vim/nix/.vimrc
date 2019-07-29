"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          BASIC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" show line number
set number
"" show relative nubmer
set relativenumber

"" show button status
set ruler

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
"set encoding=utf-8
"set termencoding=utf-8

"" highlight search result
"set hlsearch
"" realtime search
set incsearch

"" autoread modified file 
set autoread

"" auto scroll
set scrolloff=2

colorscheme default

"" code folding
"set foldmethod=indent
"set foldlevel=99



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          CUSTOMER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Quickly Run
map <F5> :w<CR> :call CompileRunCode()<CR>
func! CompileRunCode()
    "exec 'w'
    if &filetype == 'python'
        " exec '! python %'
        exec '! /home/b1uea/environment/pyvenv/bin/python %'
    elseif &filetype == 'c'
        exec '!clang % -o %:r'
        exec '! %:r'
    elseif &filetype == 'groovy'
        exec '!groovy %'
    endif
endfunc


"" key map
"""" map the ctrl+w [hjkl] to ,[hjkl] ; change windows
nnoremap ,h <C-W>h 
nnoremap ,j <C-W>j
nnoremap ,k <C-W>k 
nnoremap ,l <C-W>l 

"""" enable code folding with the space rather than za
"nnoremap <space> za



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
    "colorscheme darkblue

    
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
        set guifont=DejaVu\ Sans\ Mono\ 15
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
    
    "" syntax check
    "Plug 'w0rp/ale'
    "Plug 'valloric/youcompleteme'
    "" autocomplete 
    "Plug 'davidhalter/jedi-vim'
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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""
"" 1.3 open nerdtree automatically when vim start up on opening a directory
""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
""
""    1.4 close vim if the only window left open is a NERDTree
""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""
""    1.5 change default arrows
""
"let g:NERDTreeDirArrowExpandable = '>' 
"let g:NERDTreeDirArrowCollapsible = '-'

""  2. gruvbox
""
if has("gui_running")
    colorscheme gruvbox
    let g:gruvbox_contrast_dark='soft'  
endif

""  3. ale
""
""    3.1
"let g:ale_linters = {
"\   'python':['pylint']
"\}


