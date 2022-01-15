" UTF-8: 💩 λ ‽ ✔
set encoding=utf-8
set termguicolors

"
" Dotfiles directory.
"
let g:dfdir = expand('~/work/src/dotfiles')

""
" Add keybinding for easy quick reloading of ~/.vimrc.
"
nnoremap <Leader>rr :source $MYVIMRC<Return>

"
" Install junegunn/plug.
"
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"
let data_dir = stdpath('data') . '/site'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'othree/html5.vim', { 'for': ['html', 'php'] }
Plug 'gutenye/json5.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --production',
  \ 'for': ['javascript', 'javascriptreact', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'https://github.com/junegunn/vim-emoji'
" Plug 'https://gitlab.com/gi1242/vim-emoji-ab'

Plug 'pacha/vem-tabline'
" Plug 'pseewald/vim-anyfold'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'luisiacc/gruvbox-baby'
Plug 'sainnhe/gruvbox-material'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
" Plug 'ElmCast/elm-vim'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-surround',
" Plug 'vim-scripts/dbext.vim'
" Plug 'jwalton512/vim-blade'
" Plug 'junegunn/vader.vim'
Plug 'ryanoasis/vim-devicons'
" Plug 'habamax/vim-asciidoctor'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug '~/Cloud/Dropbox/vim/vim-uploader'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'mg979/vim-visual-multi'
" Plug 'elixir-editors/vim-elixir'
" Plug 'chr4/nginx.vim'
" Plug 'jamessan/vim-gnupg'
"Plug '~/Projects/vim/vim-tasklist-asciidoctor'

"'file:///~/.vim/bundle/dbext'
"'file:///~/.vim/bundle/vim-uploader'
call plug#end()

filetype plugin indent on
syntax on
set nocompatible
packadd! matchit
set omnifunc=syntaxcomplete#Complete
set number norelativenumber
set ruler
set showcmd
set hidden
set scrolloff=3
set timeoutlen=350
set mouse=a
set cursorline

" Indentation with SPACES
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set breakindent

""
" I like a more “expected” backspace behaviour.
"
"   :help 'backspace'
"   :help fixdel
"
set backspace=indent,start,eol

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,localoptions

"
" Always copy to the clipboard.
"
"set clipboard+=unnamedplus

"
" NETRW
"
let g:netrw_browsex_viewer= 'xdg-open'
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1 " or 3
let g:netrw_sort_options = 'i'

"let mapleader = "_"

" Indentation with HARD TABS
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set noexpandtab

set history=8192
set undolevels=199

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
" set listchars=tab:▸\ ,trail:·
set listchars=tab:␉\ ,trail:·
set list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Conceal
"
"   :help 'concealcursor'
"   :help 'conceallevel'
"
set concealcursor=
set conceallevel=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSON/JSON5

""
" 🤬 PLEASE DO NOT BE AN ASS and hide the fucking quotes, especially
" not by default! 🤬
"
let g:vim_json_conceal = 0

""
" NOTE: indentLine plugin seems to be overriding my conceal-related
" settings. Checked with `:verbose set conceallevel`.
""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent-blankline
"
" NOTE: We use guifg and it works as ctermfg in nvim/indent-blankline.
"
" NOTE: The font ProFontIIx does not display the char “¦”.
"

lua << EOF
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

"
" NERDTree
"
let g:NERDTreeWinSize=42
nnoremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <Esc>:NERDTreeToggle<CR>
nnoremap <Leader>ff :NERDTreeFind<CR>
let NERDTreeIgnore = ['\~$', 'node_modules']

"
" Prevent seeing only nerdtree window after closing or deleting a buffer.
"
" Use these instead of :bdelete, :bclose and :bwipeout.
"
nnoremap <Leader>d :bprevious<CR>:bwipeout#<CR>

" Save the file (some terminals get locked on ctrl-s, and ctrl-q unlocks).
" # We don't want C-s to lock and terminal (which is unlocked with C-q).
" `stty -ixon` on bashrc
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR><Right>

inoremap <C-Space> <C-x><C-o>

" Mapping for buffer next/prev "
map <Leader>n :bnext<Return>
map <Leader>p :bprevious<Return>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vem_tabline
"
" @NOTE: Using <C-N> for vim multiple cursors.
"
nmap <Leader>h <Plug>vem_move_buffer_left-
nmap <Leader>l <Plug>vem_move_buffer_right-
nmap <Leader>p <Plug>vem_prev_buffer-
nmap <Leader>n <Plug>vem_next_buffer-

" Insert a nice formated data and time:
inoremap <F2> <C-r>=strftime('%A, %H:%M - %B %d - %Y')

" Clears the current search
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Change directory to the path of current file/buffer.
nnoremap cd :cd %:h<CR>:pwd<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT-GUTTER
"
" Make vim show GitGutterPreviewHunk in a floating
" window.
"
let g:gitgutter_preview_win_floating = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUGITIVE
"

""
" Opens Gstatus in a vertical split on the left. Closes NERDTree in
" case it is open so I have a two-split only layout and not a messy
" one with NERDTree in the middle.
"
nnoremap <Leader>gg :NERDTreeClose \| vertical Git<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

let html_no_rendering = 1
autocmd BufReadPost *.twig set filetype=html

""
" :Man
"
" :execute "normal! \<C-w>H"
"
autocmd BufRead * if &buftype == 'quickfix'
      \ && w:quickfix_title == 'Man TOC'
      \ | wincmd H
      \ | vertical resize 36
      \ | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
" --------

""
" Problem with constant folding and unfolding.
" https://github.com/plasticboy/vim-markdown/issues/414#issuecomment-519061229
"
let g:vim_markdown_folding_style_pythonic = 1

""
" The plugin indentLine seems to be messing with the conceal
" settings... But we can override it.
"
" https://github.com/plasticboy/vim-markdown#syntax-concealing
"
let g:vim_markdown_conceal = 0

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
let g:UltiSnipsSnippetDirectories = [$HOME . '/work/src/dotfiles/ultisnips']

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

source ~/.config/nvim/vim/coc.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" React, TypeScript, JavaScript
" -----------------------------
"
" • peitalin/vim-jsx-typescript
"
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vue.js
" ------
"
" • posva/vim-vue
"
" https://github.com/posva/vim-vue#my-syntax-highlighting-stops-working-randomly
autocmd FileType vue syntax sync fromstart


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

""
" Popup Window
"
let g:fzf_layout = {
  \ 'window' : {
    \ 'width': 0.9,
    \ 'height': 0.8,
    \ 'highlight': 'Normal'
    \ }
  \ }

""
" Split the preview window on the right for wide terminals, at
" the top for narrow terminals.
"
" NOTE: If the terminal is resized, reload vimrc with
" `:source $MYVIMRC` to re-evaluate the condition.
"
let g:fzf_preview_window = winwidth(0) < 96 ? 'up:64%' : 'right:42%'

""
" Some projects I work on have a very deep hierarchy of directories
" and making the right window shorter helps reading the filenames.
"

map <Leader>f :GitFiles<CR>
map <Leader>b :Buffers<CR>
nnoremap <Leader>rg :Rg!<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>m :Marks<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 😃 vim-emoji, vim-emoji-ab ⭐
"
" USAGE: 💫
"
" • Type ‘:fire:<Space>’ (or some punctuation char,
"   newline, etc). and it will turn into 🔥.
"
" • Type ‘:<C-x><C-o>’ to see a list of suggestions. 👍
" • Type ‘:smi<C-x><C-o>’ to see a list of suggestions
"   related to smileys. 😄
"
set completefunc=gh_emoji#complete
runtime macros/emojis.vim
autocmd FileType * runtime macros/emoji-ab.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C
"

""
" Build the C file from current buffer.
"
" Check <dotfiles>/bash_incl/c-helpers.sh
"
nnoremap <F5> :execute '!C_bf %' <CR>

""
" Build and run the C file from current buffer.
"
" Check <dotfiles>/bash_incl/c-helpers.sh
"
" NOTE: In NeoVim, pressing C-F5 while in the buffer automatically
" converts to <F29>, but then it doesn't seem to work on Vim. This
" <C-F5> thing seems to work on both Vim and NeoVim.
"
" NOTE: Looks like one mapping doesn't work for Vim, and the other
" doesn't work for NeoVim, so I mapped both.
"
nnoremap <C-F5> :execute '!C_brf %' <CR>
nnoremap <F29> :execute '!C_brf %' <CR>


let files_to_source = [
      \ '~/work/local/libdev.vim',
      \ '~/work/src/dotfiles/vim-utils.vim',
      \ '~/work/src/dotfiles/.vim/digraphs.vim'
      \ ]

for file in files_to_source
  if filereadable(expand(file))
    execute 'source' . file
  endif
endfor

set background=dark
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_diagnostic_text_highlight = 0
let g:gruvbox_material_diagnostic_line_highlight = 0
let g:gruvbox_material_diagnostic_virtual_text = 'colored'

colorscheme gruvbox-material

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "jsdoc", "ruby" },
  sync_install = true,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}
EOF

""
" A little less dark than Gruvbox #282828 dark background.
"
" IndentBlanklineChar is alias to LineNr.
"
highlight LineNr guifg=#353535

"
" vim: set tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
" vim: set textwidth=68:
"
