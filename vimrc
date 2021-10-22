call plug#begin('~/.vim/plugged')
 Plug 'junegunn/seoul256.vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
call plug#end()

" enter the current millenium
set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on
colorscheme seoul256
" highlight Comment ctermfg=green

let mapleader=" "

" Position in code
set number ruler
" Always show the status line at the bottom, even if you only have one window open.
" set laststatus=2

set backspace=indent,eol,start

set hidden

" Disable audible bell because it's annoying.
"set noerrorbells visualbell t_vb=
set belloff=all

" Highlight search results
set hlsearch
set incsearch

" smartcase ignores ignorecase when capital letter is used
set ignorecase
set smartcase

" Auto + smart indent for code
set autoindent
set smartindent

" cursor leaves margin of 8 top and bottom
set scrolloff=8

" Column
"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

set undodir=~/.vim/.undo//
"set backupdir=~/.vim/.backup//
set nobackup
"set directory=~/.vim/.swp//
set noswapfile

" No delays!
"set updatetime=50

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" Function to set tab width to n spaces
function! SetTab(n)
    let &l:tabstop=a:n
    let &l:softtabstop=a:n
    let &l:shiftwidth=a:n
    set expandtab
endfunction
command! -nargs=1 SetTab call SetTab(<f-args>)

" Function to trim extra whitespace in whole file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

command! -nargs=0 Trim call Trim()
command! MakeTags !ctags -R .

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>y :%y+<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
vnoremap <Left>  <ESC>:echoe "Use h"<CR>
vnoremap <Right> <ESC>:echoe "Use l"<CR>
vnoremap <Up>    <ESC>:echoe "Use k"<CR>
vnoremap <Down>  <ESC>:echoe "Use j"<CR>
nnoremap <Left>  <ESC>:echoe "Use h"<CR>
nnoremap <Right> <ESC>:echoe "Use l"<CR>
nnoremap <Up>    <ESC>:echoe "Use k"<CR>
nnoremap <Down>  <ESC>:echoe "Use j"<CR>
nnoremap <Leader><CR> :so $MYVIMRC<CR>
"nnoremap <Leader>ev :e $MYVIMRC<CR>
"nnoremap <Leader>h :wincmd h<CR>
"nnoremap <Leader>j :wincmd j<CR>
"nnoremap <Leader>k :wincmd k<CR>
"nnoremap <Leader>l :wincmd l<CR>
" Vertical splits to show how many columns I want to display
nnoremap <Leader>> :vertical resize +5<CR>
nnoremap <Leader>< :vertical resize -5<CR>
" Horizontal splits to show how many rows I want to display
nnoremap <Leader>+ :resize +5<CR>
nnoremap <Leader>- :resize -5<CR>
"nnoremap ; :
"nnoremap : ;

" ----- FOR COMPETITIVE PROGRAMMING -----
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
autocmd FileType cc,cpp nnoremap \\ :w <bar> :!g++ -std=c++20 -O2 -Wall %:r.cc -o %:r && ./%:r<CR>
autocmd FileType python nnoremap \\ :w <bar> :!python3 %:r.py<CR>
nnoremap cpt i#include <iostream><CR><CR>using namespace std;<CR><CR>ios::sync_with_stdio(0);<CR>cin.tie(0);<CR><CR>int main() {<Esc>oreturn 0;<Esc>o}<CR><Esc>kkO
nnoremap cpp :-1read ~/[directory]/cpp_template.cc<CR>
" end COMPETITIVE PROGRAMMING

