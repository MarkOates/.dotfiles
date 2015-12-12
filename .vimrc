set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" for those fancy colors
Plugin 'chriskempson/base16-vim'

" tool integrations
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sleuth'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'rizzatti/dash.vim'

" syntax
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'scrooloose/nerdtree'


call vundle#end()

syntax on
filetype plugin indent on


" start NERDTree upon entering VIM
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror


" Basics
syntax enable
set showcmd
set showmode
set nu " line numbers on
set showmatch
" set spell
set history=1000
set backup " backup current file
set splitright
set splitbelow
set mouse=a
set clipboard=unnamed
let mapleader='.'


" make it look FAB!
"set pastetoggle=<leader>p
set t_Co=256
let base16colorspace=256
set background=dark
"colorscheme base16-eighties


" nice command to inlined html
command Xmlbreak %s/></>\r</g

" simple command to set the current path to the current filename
command SetCD cd %:p:h

" improve tabs/spaces
set ts=3
set sw=3
set expandtab
set softtabstop=2
set autoindent
"set backspace=indent,eol,start
set backspace=2 " make backspace behave as expected
set linespace=0
set listchars=tab:,.,trail:.,extends:#,nbsp:.
set list

" searching
"set incsearch
set hlsearch
set ignorecase
set smartcase

set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimswap.,~/tmp,/var/tmp,/tmp

" visual editing
set cursorline
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolljump=1
set scrolloff=5
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" statusline
hi User1 ctermbg=4 ctermfg=7
hi User2 ctermbg=1 ctermfg=7
set laststatus=2
set statusline=%1*\ %f\ %*
set statusline+=%2*%m%*
set statusline+=\ [%{getcwd()}]
set statusline+=%{fugitive#statusline()}
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

set wildmenu
set wildmode=list:longest,full


" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" wrap markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" extension aliases
au BufNewFile,BufRead *.es6 set filetype=javascript

" quick tab navigation
"nmap <silent> <leader>c :tabprev<CR>
""nmap <silent> <leader>r :tabnext<CR>


" Have the enter keys create a newline in edit mode
"map <Enter> o<ESC>
"map <S-Enter> O<ESC>

