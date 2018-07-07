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
" repeat plugin command by dot
Plug 'https://tpope.io/vim/repeat.git'
" Tagbar
Plug 'https://github.com/majutsushi/tagbar.git'
" CTRL-P
Plug 'kien/ctrlp.vim'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" clear search highlighting
Plug 'romainl/vim-cool'
" imports sorting
Plug 'stsewd/isort.nvim', {'do': ':UpdateRemotePlugins'}
" NerdTree git support
Plug 'Xuyuanp/nerdtree-git-plugin'
" Syntax highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Powerful commenting utility
Plug 'scrooloose/nerdcommenter'
" Smart auto-indentation for Python
Plug 'vim-scripts/indentpython.vim'
Plug 'https://github.com/Shougo/denite.nvim'
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
  let venv_path = '/usr/local/bin/'
endif
" ***END SETUP***

" Jedi
let g:jedi#completions_enabled = 0

"Airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
set t_Co=256
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'

"Denite
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR><Paste>
nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>1 :<C-u>DeniteBufferDir file_rec<CR>

hi link deniteMatchedChar Special

" denite-extra

nnoremap <leader>o :<C-u>Denite directory_rec -mode=normal -no-empty<CR>
nnoremap <leader>hs :<C-u>Denite change -mode=normal<CR>
nnoremap <leader>hc :<C-u>Denite command_history:cmd -mode=normal<CR>

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
let NERDTreeIgnore=['__pycache__', '\.pyc$']

"TagBar
nmap <F8> :TagbarToggle<CR>

"EDITOR SETTINGS
let g:python3_host_prog = '/usr/bin/python3.6'
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>
set ignorecase
set pastetoggle=<F3>
colorscheme NeoSolarized
"set background=dark
set colorcolumn=80,120
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
nmap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set number
filetype plugin on
filetype plugin indent on
syntax on
syntax enable
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

function MyCustomHighlights()
    hi semshiLocal           ctermfg=209 guifg=#ff875f
    hi semshiGlobal          ctermfg=214 guifg=#ffaf00
    hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#5fafff
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#ffafd7
    hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
    hi semshiAttribute       ctermfg=49  guifg=#00ffaf
    hi semshiSelf            ctermfg=249 guifg=#b2b2b2
    hi semshiUnresolved ctermbg=161 guifg=#ffaf00 cterm=underline gui=underline guibg=#d7005f
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
endfunction
autocmd ColorScheme * call MyCustomHighlights()
autocmd FileType python call MyCustomHighlights()
