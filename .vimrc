filetype off
" VUNDLE SECTION
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
" Color Scheme
Plug 'https://github.com/altercation/vim-colors-solarized.git'
" indentLine
Plug 'https://github.com/Yggdroot/indentLine.git'
" tagbar
Plug 'https://github.com/majutsushi/tagbar.git'
" vim-airline
Plug 'https://github.com/vim-airline/vim-airline.git'
" vim-airline-themes
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
" flake8
Plug 'https://github.com/nvie/vim-flake8.git'
" git support
Plug 'https://github.com/tpope/vim-fugitive.git'
" YouCompleteMe
Plug 'https://github.com/Valloric/YouCompleteMe.git'
" VimSurround
Plug 'https://github.com/tpope/vim-surround.git'
" MyPy
Plug 'integralist/vim-mypy'
" CTRL-P
Plug 'kien/ctrlp.vim'
" RUST
Plug 'rust-lang/rust.vim'
" Djnago support
Plug 'django.vim'
" Syntastic
Plug 'scrooloose/syntastic'
" Git Gutter
Plug 'airblade/vim-gitgutter'
filetype plugin on
filetype plugin indent on
syntax on
syntax enable
set background=dark
set colorcolumn=80
colorscheme solarized
set number
nnoremap <F4>:NERDTreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
nmap <F8> :TagbarToggle<CR>
let NERDTreeIgnore=['\.pyc$']
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
"let g:airline_theme='minimalist'
set t_Co=256
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'
nnoremap <leader>z viw<esc>a)<esc>hbi(<esc>lel
set pastetoggle=<F3>
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
hi Normal guibg=NONE ctermbg=NONE
" autocmd BufWritePost *.py call Flake8()
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
