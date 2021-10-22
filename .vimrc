syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

inoremap jk <Esc>
inoremap kj <Esc>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

nnoremap <F5> :w <bar> !g++ -pthread -std=c++14 -O3 -o %:r %:r.cc && ./%:r<CR>
nnoremap cpt i#include <iostream><CR><CR>using namespace std;<Esc>o<CR>int main() {<Esc>oreturn 0;<Esc>o}<CR><Esc>kkO

