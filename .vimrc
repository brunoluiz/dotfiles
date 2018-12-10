set nocompatible " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin()
Plug 'chriskempson/base16-vim' " base16 themes
Plug 'airblade/vim-gitgutter' " git marker for modified lines
Plug 'tpope/vim-fugitive' " git commands inside vim
Plug 'ervandew/supertab' " better auto-complete
Plug 'jiangmiao/auto-pairs' " auto pair chars such as ''{}...
Plug 'scrooloose/nerdcommenter' " code commenter
Plug 'sheerun/vim-polyglot' " multiple language syntax support
Plug 'tpope/vim-repeat' " enable macro to repeat plugins commands
Plug 'tpope/vim-surround' " enable to surround strings vim determined chars
Plug 'editorconfig/editorconfig-vim' " editorconfig loader
Plug 'w0rp/ale' " lint engine
Plug 'junegunn/goyo.vim' " distracion free mode
Plug 'ctrlpvim/ctrlp.vim' " same as vscode ctrl+p
Plug 'vim-airline/vim-airline' " great status line (together with tabline support)
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree' " file tree / explorer
Plug 'tpope/vim-abolish' " better search replace with :%S (eg.: get/Get => Getx)
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" lazy load (language specific)
Plug 'docteurklein/php-getter-setter.vim', { 'for' : 'php' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
call plug#end()

filetype plugin indent on    " required
set encoding=UTF-8
set ffs=unix,dos,mac " use Unix as the standard file type
set autoread " set to auto read when a file is changed from the outside

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_skip_empty_sections=1
let g:airline_powerline_fonts=0
set laststatus=2

" nerdtree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
map <C-n> :NERDTreeToggle<CR>

" nerdtree highlight
let g:NERDTreeHighlightCursorline = 0 " disable cursor line to avoid lags
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1

" ctrlp
" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<c-p>'
let ctrlp_switch_buffer=1

" keyboard
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab " convert tabs to spaces
set backspace=2 " allows the same system backspace behavior

" tweaks and visuals
set number " show line numbers
set nocursorline " do not highlight actual line (performance issues)
set showmatch " show matching items, such as [], {}...
set wildmenu " cmd auto-completion
set ruler " show line and column
set hidden " allows buffer switching without have to save the actual
set confirm " when leaving without save, shows a confirmation pop-up (instead of breaking)
set anti enc=utf-8
set autowrite "Save on buffer switch
set lazyredraw " stop redrawing everytime vim!
set foldcolumn=1 " add extra space to number column
syntax sync minlines=256
set synmaxcol=300
set re=1

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

" disable vim backup (use git for christ sake)
set nobackup
set nowb
set noswapfile

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
set completeopt-=preview

" syntax
syntax on
let g:javascript_plugin_jsdoc = 1 " better highlight for jsdocs

" neomake
" let g:neomake_javascript_enabled_makers = ['eslint'] " select js linters
" autocmd! BufWritePost * Neomake " lint on save

" ale (replace neomake)
" - disable golang linting because of vim-go package
let g:ale_linters = {
    \ 'javascript': ['prettier'],
    \ 'go': []
    \ }
let g:ale_linters_explicit = 1
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'go': []
    \ }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_completion_enabled = 1
let g:go_fmt_fail_silently = 1

" gui
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set antialias
set guioptions=
set visualbell
