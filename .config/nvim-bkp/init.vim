
"
" ~/.config/nvim/init.vim
"

" Save the file (some terminals get locked on ctrl-s, and ctrl-q unlocks).
" We don't want C-s to lock and terminal (which is unlocked with C-q).
" ‘stty -ixon’ on bashrc.
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR><Right>

call plug#begin(stdpath('data') . '/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/dbext.vim'
Plug 'jwalton512/vim-blade'
Plug 'junegunn/vader.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'habamax/vim-asciidoctor'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '~/Dropbox/vim/vim-uploader'
" Plug 'othree/html5.vim', { 'for': ['html', 'php'] }
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'posva/vim-vue'
" Plug 'Quramy/tsuquyomi'
" Plug 'Yggdroot/indentLine'
" Plug 'elzr/vim-json'
" Plug 'Quramy/tsuquyomi-vue'
" Plug 'w0rp/ale'
" Plug 'ElmCast/elm-vim'
" Plug 'tpope/vim-rails'
" Plug 'pangloss/vim-javascript'
" Plug 'jparise/vim-graphql'
" Plug 'joonty/vdebug'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer --clang-completer --system-libclang' }
"Plug '~/Projects/vim/vim-tasklist-asciidoctor'

call plug#end()


filetype plugin indent on
syntax on
set nocompatible
packadd! matchit
" set omnifunc=syntaxcomplete#Complete


set ruler
set showcmd
set number
set hidden
set scrolloff=3
set timeoutlen=350
set mouse=a

" Indentation with SPACES
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set breakindent

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,localoptions

let g:netrw_browsex_viewer= 'xdg-open'

"let mapleader = "_"

" Indentation with HARD TABS
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set noexpandtab

set history=999
set undolevels=99

set encoding=utf-8
set fileencoding=utf-8

" All three settings are necessary to avoid noise... "
set noerrorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set backup
set backupdir=~/Temp/vim_bkp/
set backupext=.vimbkp
set directory=~/Temp/vim_tmp//


" Restore cursor position (:help restore-cursor).
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set listchars=tab:▸\ ,trail:·
set list

" log, tmp, vendor, bin, libs and some other stuff are rails
" specific directories.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.*(git|hg|svn|log|tmp|vendor|bin|node_modules|lsm|gerenciador)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_elm_checkers = ['elm_make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:elm_syntastic_show_warnings = 1

" Disable for typescript since it already provides syntax checking
" stuff and other things. All other filetypes still run syntax checking
" by default.
let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'passive_filetypes': ['typescript'] }

" CtrlP "
" change default mapping "
let g:ctrlp_map = '<c-;>'

nnoremap <Leader>f :CtrlP<CR>
inoremap <Esc><Leader>f :CtrlP<CR>

nnoremap <Leader>b :CtrlPBuffer<CR>
inoremap <Esc><Leader>b :CtrlPBuffer<CR>

nnoremap <Leader>m :CtrlPMixed<CR>
inoremap <Esc><Leader>m :CtrlPMixed<CR>

"
" IndentLine
"
"let g:indentLine_color_term = 234 "'darkgray'
let g:indentLine_char = '¦' "'·'
" indentLine uses conceal stuff which together with default json.vim
" hides quotes in json files. People suggest stuff here:
" https://github.com/Yggdroot/indentLine/issues/140#issuecomment-173867054
"

"
" json-vim
"
" Also to help with indentLin + json.vim hiding quotes from json files.
let g:vim_json_syntax_conceal = 0


"
" NERDTree
"
nnoremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <Esc>:NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
let NERDTreeIgnore = ['\~$', 'node_modules', 'public/assets', 'public/fonts', 'public/uploads', 'public/images']

" Save the file (some terminals get locked on ctrl-s, and ctrl-q unlocks).
" # We don't want C-s to lock and terminal (which is unlocked with C-q).
" `stty -ixon` on bashrc
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR><Right>

inoremap <C-Space> <C-x><C-o>

" Mapping for tabpages "
map <C-N> :tabnext<Return>
map <C-P> :tabprevious<Return>

" Insert a nice formated data and time:
inoremap <F2> <C-r>=strftime('%A, %H:%M - %B %d - %Y')

" Clears the current search
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Change directory to the path of current file/buffer.
nnoremap cd :cd %:h<CR>:pwd<CR>


if hostname() == 'theforce' || hostname() == 'x-gamming'
    colorscheme mytheme1
    highlight Visual ctermbg=235 " For dark backgrounds.
else
    colorscheme mylight1
endif

" mate-terminal default config.
"if $TERM == 'xterm'
"    highlight MatchParen cterm=reverse ctermbg=NONE ctermbg=NONE
"elseif $TERM == 'rxvt-unicode-256color'
"    highlight MatchParen ctermbg=2 ctermfg=white
"endif

"highlight Visual ctermbg=233
"highlight PmenuSel ctermbg=yellow ctermfg=white
"highlight Comment ctermfg=4
"highlight Constant ctermfg=1


if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {
              \ 'elm': ['.'],
              \ 'typescript': ['.']}
endif

if hostname() == 'theforce'
  let g:ycm_server_python_interpreter = '/usr/bin/python3'
end

let html_no_rendering = 1

autocmd BufReadPost *.twig set filetype=html

"
" Number sections #[Qn]# to #[Q1]#, #[Q2]#, #[Q3]#, etc.
" Also for id='Qn' and <<Qn>>.
"
function! NumberQuestions()

    "let i = 1 | g/#\[Q.\+\]#/s//\='#[Q'.i.']#'/ | let i = i + 1

    "
    " Go to the top of the file.
    "
    normal gg

    "
    " Works for id='Qn'
    "
    let i = 1 | g/id='Q.\+'/s//\="id='Q".i."'"/ | let i = i + 1

    "
    " Works for <<Qn>>
    "
    let i = 1 | g/<<Q.\+>>/s//\="<<Q".i.">>"/ | let i = i + 1

    update

endfunction


"
" AIRLINE
"
set laststatus=2
let g:airline_powerline_fonts = 1

"
" YCM
"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

"
" UltiSnips
"
" All these three combined work for my custom snippets with custom location
" to work fine.
"
set runtimepath+=~/.dotfiles/FILES/vim
let g:UltiSnipsSnippetsDir = "~/Projects/dotfiles/.vim/myultisnips"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "myultisnips"]

" Problem: on terminals, c-tab sends tab, and tab is bound to ycm.
" s-tab doesn't work either in the terminal (urxvt at least).
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" https://github.com/Valloric/YouCompleteMe/issues/420#issuecomment-55940039

"
" Vim-Uploader
"
let g:VimUploaderHostsFile = '~/VBSMidia/WorkDATA/vimftpconf/remote-hosts.vim'

"
" ALE
"

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

" Disable ALE for .c and .h files. YCM seems to be doing
" some linting on its own, or something else is...
let g:ale_pattern_options = {
    \ '.*\.c$': { 'ale_enabled': 0 },
    \ '.*\.h$': { 'ale_enabled': 0 },
\ }


"
" habamax/vim-asciidoctor
"
"
" Fold sections, default `0`.
let g:asciidoctor_folding = 1

" Fold options, default `0`.
let g:asciidoctor_fold_options = 1

let g:asciidoctor_fenced_languages = ['python', 'c', 'javascript', 'ruby', 'php', 'elm', 'haskell', 'bash', 'sh']


"
" coc
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

