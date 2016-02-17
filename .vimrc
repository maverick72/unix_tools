set t_Co=256
colo mustang
syntax on

set nocompatible              " required
filetype off                  " required

set encoding=utf-8

let python_highlight_all=1

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=89 |
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/vim/plugins')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-fugitive'
Plugin 'Powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h9
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_dividers_override = ["\Ue0b0", "\Ue0b1", "\Ue0b2", "\Ue0b3"]
let g:Powerline_symbols_override = { 'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2" }
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Map for NerdTree
map <F2> :NERDTreeToggle<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator " modes)
" ]]            Jump on next class or function (normal, visual, operator " modes)
" [M            Jump on previous class or method (normal, visual, operator " modes)
" ]M            Jump on next class or method (normal, visual, operator " modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
