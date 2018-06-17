call plug#begin('~/.local/share/nvim/plugged')
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
" Completition
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
" Syntastic
Plug 'vim-syntastic/syntastic'
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
" clear search highlighting
Plug 'romainl/vim-cool'
" code formatting tool
Plug 'ambv/black'
" imports sorting
Plug 'stsewd/isort.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Powerful commenting utility
Plug 'scrooloose/nerdcommenter'
" Smart auto-indentation for Python
Plug 'vim-scripts/indentpython.vim'
call plug#end()

" ***SETUP PYTHON PATH***
" Point YCM to the Pipenv created virtualenv, if possible
" At first, get the output of 'pipenv --venv' command.
let pipenv_venv_path = system('pipenv --venv')
" The above system() call produces a non zero exit code whenever
" a proper virtual environment has not been found.
" So, second, we only point YCM to the virtual environment when
" the call to 'pipenv --venv' was successful.
" Remember, that 'pipenv --venv' only points to the root directory
" of the virtual environment, so we have to append a full path to
" the python executable.
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '') . '/bin/'
else
  let venv_path = '/usr/bin/'
endif
" ***END SETUP***

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

"Deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Black
let g:black_fast = 0
let g:black_linelength = 79

"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_flake8_exec = venv_path . 'flake8'
let g:syntastic_python_pylint_exec = venv_path . 'pylint'
let g:syntastic_python_pylint_args='-d C0111 --load-plugins=pylint-django --max-line-length=120'
let g:syntastic_python_flake8_post_args='--max-line-length=120'

"NerdTree
nnoremap <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']

"TagBar
nmap <F8> :TagbarToggle<CR>

"EDITOR SETTINGS
let g:python3_host_prog = '/usr/bin/python3.6'
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>
set ignorecase
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
