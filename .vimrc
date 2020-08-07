" utf8=✔ 💩

" **** BASIC **** "

"
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'othree/html5.vim', { 'for': ['html', 'php'] }
Plug 'cakebaker/scss-syntax.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ElmCast/elm-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/dbext.vim'
Plug 'jwalton512/vim-blade'
Plug 'junegunn/vader.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'habamax/vim-asciidoctor'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '~/Dropbox/vim/vim-uploader'
"Plug '~/Projects/vim/vim-tasklist-asciidoctor'

"'file:///~/.vim/bundle/dbext'
"'file:///~/.vim/bundle/vim-uploader'

call plug#end()

filetype plugin indent on
syntax on
set nocompatible
packadd! matchit
set omnifunc=syntaxcomplete#Complete
set number
set ruler
set showcmd
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

set history=8192
set undolevels=199

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

"
" Create-React-App fresh project does not auto-reload on save.
"
" https://create-react-app.dev/docs/troubleshooting/#npm-start-doesnt-detect-changes
"
" https://webpack.js.org/guides/development/#adjusting-your-text-editor
"
set backupcopy=yes


" Restore cursor position (:help restore-cursor).
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set listchars=tab:▸\ ,trail:·
set list


"
" FZF
"
silent nnoremap <Leader>f :Files
map <Leader>f :GFiles!<CR>
map <Leader>b :Buffers<CR>
nnoremap <Leader>g :Rg!<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>m :Marks<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine
"

" NOTE: The font ProFontIIx does not display the char “¦”.
"
let g:indentLine_char_list = ['·', ':', '¦', '┆', '┊', '|']
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

" Mapping for buffer next/prev "
map <C-N> :bnext<Return>
map <C-P> :bprevious<Return>

" Insert a nice formated data and time:
inoremap <F2> <C-r>=strftime('%A, %H:%M - %B %d - %Y')

" Clears the current search
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Change directory to the path of current file/buffer.
nnoremap cd :cd %:h<CR>:pwd<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

let g:gruvbox_bold = 0
let g:gruvbox_italic = 0

if $THEME == 'dark'
    set background=dark
    colorscheme gruvbox

    " For visual selections. The reverse thing looks ugly. This
    " transparent-like grayish thing looks and feels much more pleasant.
    highlight Visual cterm=NONE gui=NONE ctermbg=234 guibg=#393939
else
    " colorscheme mylight1
    " let g:airline_theme = 'xtermlight'
    set background=light
    colorscheme gruvbox
    let g:airline_theme = 'gruvbox'
    "
    " Not so yellowish background for light theme. Let's make
    " it just a very slight yellow. Set ctermbg=NONE so it uses
    " the terminal background.
    "
    hi Normal ctermbg=230
    " No reverse, very light yellow selection.
    hi Visual cterm=NONE ctermbg=229
    let g:indentLine_color_term = 187
    let g:gruvbox_invert_signs=0
    let g:gitgutter_override_sign_column_highlight=0
    hi SignColumn ctermbg=229
    hi GitGutterAdd ctermbg=229
    hi GitGutterChange ctermbg=229
    hi ColorColumn ctermbg=229
    hi Pmenu ctermbg=229
    hi PmenuSel ctermbg=3 ctermfg=229
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
let g:airline#extensions#tabline#enabled = 0

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

"
" In a project that uses ‘standard’ as an ESLint preset, it seems like ALE is
" running both eslint _and_ standard, causing a lot of errors. With this
" setting, we allow only eslint to run, and it picks configs from
" ‘.eslintrs.js’ in the project's directory, and seems like everything works
" fine then.
"
let g:ale_linters = { 'javascript': ['eslint'] }

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC — Conquer of Completion
" ---------------------------
"
"
" GoTo code navigation.

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"
" Display diagnostics (errors and warnings) and documentation.
" Type uppercase ‘K’ to activate, and any motion (like ‘j’, ‘k’,
" ‘h’, ‘b’, ‘<C-o>’, ‘<C-i>’, etc.) to deactivate.
"
nnoremap <silent> K :call CocAction('doHover')<CR>

"
" Navigate to next/prev errors.
"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"
" Rename symbol
"
nmap <leader>rn <Plug>(coc-rename>



" posva/vim-vue
"
" https://github.com/posva/vim-vue#my-syntax-highlighting-stops-working-randomly
autocmd FileType vue syntax sync fromstart

"
" pangloss/vim-javascript
"

let g:javascript_plugin_jsdoc = 1
"augroup javascript_folding
"    au!
"    au FileType javascript setlocal foldmethod=syntax
"    let g:javascript_plugin_jsdoc = 1
"    set foldcolumn=0
"    if !has('gui_running')
"        highlight FoldColumn ctermbg=232
"    else
"        highlight FoldColumn guibg=bg
"    endif
"augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"
"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI, GVim
"
if (has('gui_running'))
  " No menu bar
  set guioptions-=m
  "set guioptions-=M
  " No toolbar
  set guioptions-=T

  " Desabilita todos os scrollbars.
  " Right-hand scrollbar when thereis a vertially split window
  set guioptions-=R
  " Left-Hand scrollbar
  set guioptions-=L
  " Left-hand scrollbar when vertically split window
  set guioptions-=l
  " Bottom horizontal scrollbar
  set guioptions-=b
  " Habilitar o icone.
  set guioptions=i
  " Right-hand scrollbar
  set guioptions+=r
  " Right scroolbar when there are splits (NERDtree, taglist).
  set guioptions+=R
  set guioptions+=L
  set guioptions+=e

  set lines=45
  set columns=120

  "
  " The font ProFontIIx does not display the char “¦”.
  "
  "set guifont=ProFontWindows\ Nerd\ Font\ Mono\ 16

  set guifont=SpaceMono\ Nerd\ Font\ Mono\ Bold\ 13

  set guicursor=n-c:hor14,i:ver14,a:blinkon0
endif

"
" CUSTOM HELPERS
"
source ~/Projects/dotfiles/.vim/helpers/redir.vim


" vim: set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:

