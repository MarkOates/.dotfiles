set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" for those fancy colors
Plugin 'chriskempson/base16-vim'

" tool integrations
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-git'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-unimpaired'
" Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-rails'
Plugin 'airblade/vim-gitgutter'
"Plugin 'mattn/webapi-vim'
"Plugin 'mattn/gist-vim'
"Plugin 'rizzatti/dash.vim'

" file browser
Plugin 'ctrlpvim/ctrlp.vim'

" file formats
Plugin 'tikhomirov/vim-glsl'

" syntax
"Plugin 'tpope/vim-ragtag'
"Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-bundler'
"Plugin 'tpope/vim-rake'
"Plugin 'tpope/vim-rails'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'scrooloose/syntastic'
"Plugin 'othree/yajs.vim'
"Plugin 'mxw/vim-jsx'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'kien/rainbow_parentheses.vim'

Plugin 'EvanDotPro/nerdtree-chmod' " adds a chmod option in NERDTree 'm' menu
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine' " hilights indents

call vundle#end()

syntax on
filetype plugin indent on
let mapleader="," " for nerdcommenter
filetype plugin on " for nerdcommenter


" start NERDTree upon entering VIM
" autocmd VimEnter * NERDTree " starts nerdtree when opening vim
" autocmd BufEnter * NERDTreeMirror " starts nerdtree when a new tab is opened
" autocmd VimEnter * wincmd p " after opening nerdtree, will move the cursor back to the window


" Basics
syntax enable
set showcmd
set showmode
set nu " line numbers on
" set showmatch
" set spell
set history=1000
set backup " backup current file
set splitright
set splitbelow
set mouse=a
set clipboard=unnamed
"let mapleader='.'


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
echo $VIM_NUM_SPACES
let env_how_many_spaces=$VIM_NUM_SPACES
if $VIM_NUM_SPACES == ""
  " echo " = = = VIM_NUM_SPACES env var NOT SET, defaulting to 2"
  let env_how_many_spaces=2
else
  echo "VIM_NUM_SPACES env var SET to " . $VIM_NUM_SPACES
  let env_how_many_spaces=$VIM_NUM_SPACES
endif
let &ts=env_how_many_spaces
let &sw=env_how_many_spaces
let &tabstop=env_how_many_spaces
set expandtab
let &softtabstop=env_how_many_spaces
set autoindent
"set backspace=indent,eol,start
set backspace=2 " make backspace behave as expected
set linespace=0
" set listchars=tab:,.,trail:.,extends:#,nbsp:.
"set list

" searching
"set incsearch
set hlsearch
set ignorecase
set smartcase
hi Search cterm=NONE ctermfg=NONE ctermbg=darkblue

set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimswap.,~/tmp,/var/tmp,/tmp

" visual editing
"set cursorline
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolljump=1
set scrolloff=5
" set colorcolumn=80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%121v.\+/

" statusline
hi User1 ctermbg=4 ctermfg=7
hi User2 ctermbg=1 ctermfg=7
hi User3 ctermbg=3 ctermfg=1
set laststatus=2
set statusline=%1*\ %t\ %*
set statusline+=%2*%m%*
" set statusline+=\ [%f]
" set statusline+=\ [%{getcwd()}]
set statusline+=%3*\ %*
" set statusline+=%3*\ %{fugitive#statusline()}\ %*
set statusline+=%=%-14.(%l,%c%V%)\ %p%%



set wildmenu
set wildmode=list:longest,full


" Rainbow parens
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

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


" disable auto-formatting of comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=r " prevents auto-adding comments on ENTER
autocmd BufNewFile,BufRead * setlocal formatoptions-=o " prevents auto-adding comments when adding new lines with o or O

" Have the vim cursor change when in edit mode/insert mode
" NOTE: this is only effective for iTerm2 on OSX
" e.g.: http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" always expand the number of spaces to 3 for c/cpp
autocmd Filetype c setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype cpp setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3



" remap the ; key to be ;
nnoremap ; :
vnoremap ; :



" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.o$|\.obj$|\.lib$|\.a$',
  \ }


" add shortcuts for nerdtree commands
command Nt :NERDTree
command Ntf :NERDTreeFind
