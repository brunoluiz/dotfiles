set nocompatible " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin()
Plug 'chriskempson/base16-vim' " base16 themes
Plug 'tpope/vim-fugitive' " git commands inside vim
Plug 'jiangmiao/auto-pairs' " auto pair chars such as ''{}...
Plug 'sheerun/vim-polyglot' " multiple language syntax support
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
" Plug 'honza/vim-snippets' " Snippets are separated from the engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bkad/CamelCaseMotion'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-projectionist'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/csv.vim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-rhubarb'
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
map <C-n> :NERDTreeToggle<CR>

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
    \ && (!exists('g:colors_name')
    \ || g:colors_name != 'base16-$BASE16_THEME')
  let base16colorspace=256
  colorscheme base16-$BASE16_THEME
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

" syntax
syntax on
let g:javascript_plugin_jsdoc = 1 " better highlight for jsdocs

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
  let args['*.cpp'] =           { 'alternate': '{}.h' }
  let args['*.h'] =             { 'alternate': '{}.cpp' }
  let args['src/*.js'] =        { 'alternate': ['tests/spec/{}.spec.js', 'tests/{}.spec.js'] }
  let args['tests/spec/*.spec.js'] = { 'alternate': ['{}.js', 'src/{}.js'] }
  let args['tests/*.spec.js'] = { 'alternate': ['{}.js', 'src/{}.js'] }
  let args['dev-aws/*'] =       { 'alternate': 'prod-aws/{}' }
  let args['dev-gcp/*'] =       { 'alternate': 'prod-gcp/{}' }
  let args['dev-merit/*'] =     { 'alternate': 'prod-aws/{}' }
  let args['*.up.sql'] =        { 'alternate': '{}.down.sql' }
  let args['*.down.sql'] =      { 'alternate': '{}.up.sql' }
  autocmd User ProjectionistDetect call projectionist#append(getcwd(), args)
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Beware, coc.nvim configs below!!
" Most of it allow your vim to be similar to VSCode
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-css', 'coc-highlight', 'coc-go', 'coc-html', 'coc-explorer', 'coc-tsserver', 'coc-git', 'coc-snippets']
" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ra  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
