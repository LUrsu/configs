"Vim5 and later versions support syntax highlighting. Uncommenting the next
"line enables syntax highlighting by default.
if has("syntax")
 syntax on
endif
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set ignorecase " Do case insensitive matching
"set smartcase " Do smart case matching
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes)
set nu " Turn on line numbers
set ai " Turn on Auto indention
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set completeopt=longest,menuone "auto-completion
set ruler
set smartindent
set laststatus=2
set backspace=indent,eol,start
" Jump to last known position
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \ exe "normal g`\"" |
 \ endif

" vim-perl added functionality https://github.com/vim-perl/vim-perl
call plug#begin('~/.vim/plugged')

" Add the vim-perl plugin using vim-plug
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
" Add the perldoc-vim plugin use K on keyword to look up the docs http://vimawesome.com/plugin/perldoc-vim-love-story
Plug 'hotchpotch/perldoc-vim'

" vim background colors http://vimawesome.com/plugin/vim-colors-solarized-sparks-fly
Plug 'altercation/vim-colors-solarized'

"vim-airline status bar modifier https://github.com/bling/vim-airline
Plug 'bling/vim-airline'

"vim-gitgutter to show git diff https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

"vim-indent used to show indentation in vim documents http://vimawesome.com/plugin/indent-guides
Plug 'nathanaelkane/vim-indent-guides'

"vim-go https://github.com/fatih/vim-go
Plug 'fatih/vim-go'

"sourcegraph for vim https://github.com/sourcegraph/sourcegraph-vim
Plug 'sourcegraph/sourcegraph-vim', {'for': ['go']}

" Autocompletion for go code https://github.com/nsf/gocode
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

call plug#end()

"SourceGraph settings
let g:SOURCEGRAPH_AUTO = "false"
nnoremap <F2> :GRAPH<CR>

" Vim-go settings
" key mappings
nnoremap <F3> :GoDoc<CR>
" highlighting rules
let g:go_highlight_extra_types = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1

" gocode settings
filetype plugin on

" Solarized
set background=dark
" Solarized options
colorscheme solarized

"Airline
let g:airline_powerline_fonts=1

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
