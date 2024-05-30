set nocompatible " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin()
" Plug 'chriskempson/base16-vim' " base16 themes
Plug 'RRethy/base16-nvim'
Plug 'tpope/vim-fugitive' " git commands inside vim
Plug 'jiangmiao/auto-pairs' " auto pair chars such as ''{}...
Plug 'tpope/vim-repeat' " enable macro to repeat plugins commands
Plug 'tpope/vim-surround' " enable to surround strings vim determined chars
Plug 'editorconfig/editorconfig-vim' " editorconfig loader
Plug 'w0rp/ale' " lint engine
Plug 'junegunn/goyo.vim' " distracion free mode
Plug 'vim-airline/vim-airline' " great status line (together with tabline support)
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree' " file tree / explorer
Plug 'scrooloose/nerdcommenter' " code commenter
Plug 'tpope/vim-abolish' " better search replace with :%S (eg.: get/Get => Getx)
Plug 'airblade/vim-gitgutter' " git marker for modified lines
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-projectionist'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/csv.vim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-rhubarb'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Nvim Treesitter configurations and abstraction layer
Plug 'williamboman/mason.nvim' " Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
Plug 'williamboman/mason-lspconfig.nvim' " Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
Plug 'neovim/nvim-lspconfig' " Quickstart configs for Nvim LSP
call plug#end()

filetype plugin indent on " required
set encoding=UTF-8
set ffs=unix,dos,mac " use Unix as the standard file type
set autoread " set to auto read when a file is changed from the outside

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#searchcount#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_skip_empty_sections=1
let g:airline_powerline_fonts=0
let g:airline#extensions#coc#enabled=1
set laststatus=2

" nerdtree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
nnoremap <C-n> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" nerdtree highlight
let g:NERDTreeHighlightCursorline = 0 " disable cursor line to avoid lags

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1

" fzf
nmap <C-P> :FZF<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden' " filters out .gitignore files

" keyboard
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab " convert tabs to spaces
set backspace=2 " allows the same system backspace behavior

" tweaks and visuals
set number relativenumber " show relative line numbers and absolute
set nocursorline " do not highlight actual line (performance issues)
set showmatch " show matching items, such as [], {}...
set wildmenu " cmd auto-completion
set ruler " show line and column
set hidden " allows buffer switching without have to save the actual
set confirm " when leaving without save, shows a confirmation pop-up (instead of breaking)
" set anti enc=utf-8
set autowrite "Save on buffer switch
set lazyredraw " stop redrawing everytime vim!
set foldcolumn=1 " add extra space to number column
syntax sync minlines=256
set synmaxcol=300
" set re=1
set wrap linebreak nolist
set signcolumn=yes " gutter and line coutns don't overlap

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
set foldlevelstart=10000

" gui vim
if exists('$BASE16_THEME')
    "let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif

" disable vim backup (use git for christ sake)
set nobackup
set nowb
set noswapfile

" trailling spaces
set noeol
" set binary

" mouse enable
set mouse=a

" clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" invisible chars
set list
set listchars=tab:▸\ ,eol:¬,trail:·,space:·

" enable omnifunction
set completeopt=menu,menuone,preview,noselect,noinsert

" ale
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'terraform': ['terraform'],
      \'go': ['goimports', 'gofumpt'],
      \'solidity': ['remove_trailing_lines', 'trim_whitespace']
      \}
let g:ale_linters = {
      \ 'typescript': ['eslint'],
      \ 'javascript': ['eslint'],
      \ 'terraform': ['terraform'],
      \ 'yaml': ['yamllint'],
      \ 'graphql': ['gqlint'],
      \ 'solidity': ['solc', 'solhint'],
      \ 'go': ['golangci-lint', 'gopls']
      \}
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 'auto'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_completion_enabled=0
let g:ale_set_highlights=1
let g:ale_set_signs=1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
command! ALEDisableFixers       let g:ale_fix_on_save=0
command! ALEEnableFixers        let g:ale_fix_on_save=1
command! ALEDisableFixersBuffer let b:ale_fix_on_save=0
command! ALEEnableFixersBuffer  let b:ale_fix_on_save=1
command! ALEToggleFixers call functions#fckALEToggle('global')
command! ALEToggleFixersBuffer call functions#fckALEToggle('buffer')
highlight ALEWarning cterm=underline ctermfg=LightYellow ctermbg=Yellow
highlight ALEError cterm=underline ctermfg=LightRed ctermbg=DarkRed

" gui
" set guifont=Source\ Code\ Pro\ for\ Powerline:h13
" set antialias
" set guioptions=
" set visualbell

" Ack search
let g:ackprg = 'ag --nogroup --nocolor --column'

" toggles absolute and relative number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" CamelCaseMotion

let g:camelcasemotion_key = '<leader>'

" vim-projectionist

augroup projection_extension
  let args = {}
  let args['*.go'] =            { 'alternate': '{}_test.go' }
  let args['*_test.go'] =       { 'alternate': '{}.go' }
  let args['src/*.js'] =        { 'alternate': ['tests/spec/{}.spec.js', 'tests/{}.spec.js'] }
  let args['tests/spec/*.spec.js'] = { 'alternate': ['{}.js', 'src/{}.js'] }
  let args['tests/*.spec.js'] = { 'alternate': ['{}.js', 'src/{}.js'] }
  let args['*.up.sql'] =        { 'alternate': '{}.down.sql' }
  let args['*.down.sql'] =      { 'alternate': '{}.up.sql' }
  autocmd User ProjectionistDetect call projectionist#append(getcwd(), args)
augroup END

lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query", "go", "gomod", "gowork", "gotmpl", "gosum", "javascript", "json", "typescript", "terraform", "yaml", "sql", "diff" },
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  auto_install = true, -- Automatically install missing parsers when entering buffer (set to false if you don't have `tree-sitter` CLI installed)
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua <<EOF
require("mason").setup() -- !! THIS MUST BE CALLED BEFORE ANY LANGUAGE SERVER CONFIGURATION
require("mason-lspconfig").setup {
  automatic_installation = true
}
EOF

lua <<EOF
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.terraformls.setup{}
lspconfig.gopls.setup{}
lspconfig.yamlls.setup{}
lspconfig.golangci_lint_ls.setup{}
lspconfig.vimls.setup{}
lspconfig.jsonls.setup{}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF
