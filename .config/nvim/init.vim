call plug#begin('~/.local/share/nvim/plugged')
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
" Jedi
Plug 'davidhalter/jedi-vim'
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
" Syntastic
Plug 'scrooloose/syntastic'
" git support
Plug 'https://github.com/tpope/vim-fugitive.git'
" Git Gutter
Plug 'airblade/vim-gitgutter'
" VimSurround
Plug 'https://github.com/tpope/vim-surround.git'
" Tagbar
Plug 'https://github.com/majutsushi/tagbar.git'
" CTRL-P
Plug 'kien/ctrlp.vim'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" SuperTab
Plug 'ervandew/supertab'
call plug#end()

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
set t_Co=256
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8']

"NerdTree
nnoremap <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']

"EDITOR SETTINGS
set pastetoggle=<F3>
colorscheme NeoSolarized
set background=dark
set colorcolumn=80
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
hi Normal guibg=NONE ctermbg=NONE
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set number
filetype plugin on
filetype plugin indent on
syntax on
syntax enable
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
