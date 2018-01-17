filetype off
" VUNDLE SECTION
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" nerdtree
Plugin 'https://github.com/scrooloose/nerdtree.git'
" Color Scheme
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
" indentLine
Plugin 'https://github.com/Yggdroot/indentLine.git'
" tagbar
Plugin 'https://github.com/majutsushi/tagbar.git'
" vim-airline
Plugin 'https://github.com/vim-airline/vim-airline.git'
" vim-airline-themes
Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
" flake8
Plugin 'https://github.com/nvie/vim-flake8.git'
" git support
Plugin 'https://github.com/tpope/vim-fugitive.git'
" YouCompleteMe
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" VimSurround
Plugin 'https://github.com/tpope/vim-surround.git'
call vundle#end()  
filetype plugin on
filetype plugin indent on
syntax on
syntax enable
set background=dark
colorscheme solarized
set number
nnoremap <F4> :NERDTreeToggle<CR>
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
autocmd BufWritePost *.py call Flake8()