filetype off
call pathogen#infect()
call pathogen#helptags()
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
set pastetoggle=<F3>
