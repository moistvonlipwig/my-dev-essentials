" ===============================
"   General Settings
" ===============================
set nocompatible              " Don't emulate old Vi
set encoding=utf-8
set number                    " Show line numbers
set relativenumber            " Relative line numbers for movement
set ruler                     " Show cursor position
set cursorline                " Highlight current line
set showmatch                 " Highlight matching brackets
set wildmenu                  " Better command-line completion
set hidden                    " Allow switching buffers without saving
set clipboard=unnamedplus     " Use system clipboard
set mouse=a                   " Enable mouse support

" ===============================
"   Indentation & Tabs
" ===============================
set tabstop=4                 " Number of spaces for a tab
set shiftwidth=4              " Number of spaces for auto-indent
set expandtab                 " Convert tabs to spaces
set autoindent
set smartindent
set smarttab

" Language-specific overrides
augroup python_indent
    autocmd!
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
augroup END

augroup c_indent
    autocmd!
    autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END

" ===============================
"   Search
" ===============================
set incsearch                 " Search while typing
set ignorecase                " Case-insensitive search
set smartcase                 " … unless capital letters used
set hlsearch                  " Highlight matches

" ===============================
"   UI / Appearance
" ===============================
syntax enable
set termguicolors
colorscheme desert            " Change to your favorite scheme

" ===============================
"   Plugins (using vim-plug)
" ===============================
call plug#begin('~/.vim/plugged')

" File navigation & fuzzy finding
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Status bar
Plug 'vim-airline/vim-airline'

" Git integration
Plug 'tpope/vim-fugitive'

" Syntax highlighting & linting
Plug 'dense-analysis/ale'          " Async linting for Python/C

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Better commenting
Plug 'tpope/vim-commentary'

" Surround text objects easily
Plug 'tpope/vim-surround'

" Python-specific helpers
Plug 'vim-python/python-syntax'
Plug 'psf/black', { 'branch': 'main' }   " Python code formatter

call plug#end()

" ===============================
"   Plugin Config
" ===============================

" ALE (linting/formatting)
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'c': ['clang'],
\   'cpp': ['clang++']
\}
let g:ale_fixers = {
\   'python': ['black'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format']
\}
let g:ale_fix_on_save = 1

" CoC (completion)
let g:coc_global_extensions = [
\ 'coc-pyright',    " Python language server
\ 'coc-clangd',     " C/C++ completion
\ 'coc-snippets'
\ ]

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ===============================
"   Keybindings
" ===============================
nnoremap <SPACE> :Files<CR>   " Fuzzy search files with fzf
nnoremap <C-p> :Buffers<CR>   " Switch buffers
nnoremap <C-f> :Ag<CR>        " Search in project

" Save with Ctrl-S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
