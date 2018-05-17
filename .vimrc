set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
" Plugin 'tpope/vim-abolish' " still studying if it's worth my attention
call vundle#end()            " required

filetype plugin indent on    " required

" airline 
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_powerline_fonts=1
set laststatus=2

" nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeQuitOnOpen = 1
map <C-n> :NERDTreeToggle<CR>

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1

" ctrlp
" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<c-p>'
let ctrlp_switch_buffer=0

" keyboard
set tabstop=2
set softtabstop=4
set shiftwidth=4
set expandtab " convert tabs to spaces
set backspace=2 " allows the same system backspace behavior

" tweaks and visuals
set number " show line numbers
set cursorline " highlight actual line
set showmatch " show matching items, such as [], {}...
set wildmenu " cmd auto-completion
set ruler " show line and column
set hidden " allows buffer switching without have to save the actual
set confirm " when leaving without save, shows a confirmation pop-up (instead of breaking)
set anti enc=utf-8
set autowrite "Save on buffer switch
set lazyredraw " stop redrawing everytime vim!

" keyboard general mappings
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" search
set incsearch " search as characters are entered
set hlsearch " highlight searchs
set ignorecase " use case insensitive search, except when using capital letters
set smartcase " ignore case if search pattern is all lowercase

" folding
set foldenable
set foldmethod=indent
set foldlevelstart=10

" gui vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just dont
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" swapfiles location
set backupdir=/tmp//
set directory=/tmp//

" trailling spaces
set noeol

" mouse enable
set mouse=a

" clipboard
set clipboard=unnamed

" invisible chars
set list
set listchars=tab:▸\ ,eol:¬,trail:·,space:·

" enable omnifunction
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" syntax 
syntax on
let g:javascript_plugin_jsdoc = 1 " better highlight for jsdocs

" neomake
" let g:neomake_javascript_enabled_makers = ['eslint'] " select js linters
" autocmd! BufWritePost * Neomake " lint on save

" ale (replace neomake)
let g:ale_linters = { 'javascript': ['eslint'] } " select js linters
