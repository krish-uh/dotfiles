set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'yggdroot/indentline'
Plugin 'flazz/vim-colorschemes'
Plugin 'morherz/gruvbox'
Plugin 'jremmen/vim-ripgrep'

" Pass the path to set the runtimepath properly.

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
call vundle#end()            " required
filetype plugin indent on    " required

"------------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------

syntax enable                   " Enable syntax highlighting. 

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set autoindent                  " Indentation level for next line.
set backspace=indent,eol,start  " Be more flexible with backspace.
set autoread                    " reload files when changed.
set showmode                    " Don't show mode, for airline.
set nowrap                      " Don't wrap lines.
set incsearch                   " Incremental search.
set ignorecase                  " Ignore case while searching.
set number                      " Show line numbers.
set nocursorline                  " Highlight current line.
set ruler                       " Show where we are.
set showmatch                   " Show matching brackets.
set colorcolumn=80              " Guideline at 80th column.
set shiftwidth=4                " 4 indents for tabs.
set expandtab                   " Expand tabs to spaces.
set tabstop=4                   " 4 column indents.
set softtabstop=4               " Insert mode tab and backspace use 4 spaces.
set clipboard+=unnamed          " Yank and paste with system clipboard.
set laststatus=2                " Show status line.
set wildmenu                    " Wildcard searches.
set complete-=i                 " Ignore included files in complete.
set smarttab                    " Use smarttabs. 
set nobackup                    " No need for backups.
set nowb                        " No autobackup.
set noswapfile                  " No swap.
set undodir=~/.vim/undodir
set undofile

"------------------------------------------------------------------------------
" Plugin related settings
" -----------------------------------------------------------------------------

"  airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" deoplete
let g:deoplete#enable_at_startup=1

" gruvbox
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='soft'

" seoul256
let g:seoul256_background = 237
let g:seoul256_light_background = 253

"------------------------------------------------------------------------------
" Key remaps
"------------------------------------------------------------------------------

let mapleader="\<Space>"

nnoremap <leader>w :w<cr>
inoremap <leader>w <C-c>:w<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader><leader> :
nnoremap <leader>e :Files<cr>

ino jk <esc>
cno jk <esc>
vno v <esc>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Reformat selected text (fill region)
nnoremap <leader>fr gq
" Reformat paragraph (fill paragraph)
nnoremap <leader>fp gq}

" Configure leader guide.
"let g:lmap = {}
"call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
"nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
"vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

if has('gui_running')
    set lines=40
    set macligatures
    set guifont=PragmataPro:h14
endif

"set background=light
"colorscheme gruvbox
"colorscheme seoul256
colorscheme solarized

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

if has('nvim')
    set termguicolors	" Doesn't work with Terminal.app.
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
