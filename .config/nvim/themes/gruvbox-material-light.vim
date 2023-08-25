"
" https://github.com/sainnhe/gruvbox-material
"
" This file is sourced in init.lua.
"

set background=light

""
" Let's make bg not transparent so it works better accross
" different terminal emulators and including tmux.
"
let g:gruvbox_material_transparent_background = 1

""
" Probably doesn't make any difference with transparent bg.
"
let g:gruvbox_material_background = 'hard'

let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_diagnostic_text_highlight = 0
let g:gruvbox_material_diagnostic_line_highlight = 0
let g:gruvbox_material_diagnostic_virtual_text = 'colored'

colorscheme gruvbox-material

let yellow0 = '#ffffd8'
let yellow1 = '#fdfec0'
let yellow2 = '#fdf5b0'
let yellow3 = '#fdf5a0'
let yellow4 = '#fdf590'
let yellow5 = '#fbe77d'
let yellow6 = '#f9f977'
let yellow7 = '#fbfb00'
let orange1 = '#f7d598'
let orange2 = '#ecc682'

"
" Very light yellow bg color.
"
call gruvbox_material#highlight('Normal', ['NONE', 'NONE'], [yellow0, '140'])

call gruvbox_material#highlight('CursorLine', ['NONE', 'NONE'], [yellow1, '140'])
call gruvbox_material#highlight('CursorLineNr', ['NONE', 'NONE'], [yellow1, '140'])
call gruvbox_material#highlight('ColorColumn', ['NONE', 'NONE'], [yellow1, '140'])

"
" CoC completion popup, :buffer list.
"
call gruvbox_material#highlight('Pmenu', ['NONE', 'NONE'], [yellow1, '140'])
call gruvbox_material#highlight('CocFloating', ['NONE', 'NONE'], [yellow1, '140'])
call gruvbox_material#highlight('PmenuSel', ['NONE', 'NONE'], [yellow5, '140'])

"
" Sidebar on CocFloating popop.
"
call gruvbox_material#highlight('CocFloatSbar', ['NONE', 'NONE'], [orange1, '140'])
call gruvbox_material#highlight('CocFloatThumb', ['NONE', 'NONE'], [orange2, '140'])

call gruvbox_material#highlight('CocSearch', ['NONE', 'NONE'], [yellow1, '140'])

call gruvbox_material#highlight('Search', ['NONE', 'NONE'], [yellow6, '120'])
call gruvbox_material#highlight('CurSearch', ['NONE', 'NONE'], [yellow7, '120'])
call gruvbox_material#highlight('IncSearch', ['NONE', 'NONE'], [yellow7, '120'])

"
" Visual selection.
"
call gruvbox_material#highlight('Visual', ['NONE', 'NONE'], [yellow3, '140'])
