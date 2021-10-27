scriptencoding utf-8

" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Customized version of the gruvbox color scheme for Vim
" Author: morhetz <morhetz@gmail.com>, mystilleef <mystilleef@gmail.com>
" Source: https://github.com/mystilleef/gruvbox
" Last Modified: 5 Sep 2021
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name='gruvbox'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Global Settings

if !exists('g:gruvbox_bold')
  let g:gruvbox_bold=1
endif

if !exists('g:gruvbox_italic')
  if has('gui_running') || $TERM_ITALICS ==? 'true'
    let g:gruvbox_italic=1
  else
    let g:gruvbox_italic=0
  endif
endif

if !exists('g:gruvbox_undercurl')
  let g:gruvbox_undercurl=1
endif

if !exists('g:gruvbox_underline')
  let g:gruvbox_underline=1
endif

if !exists('g:gruvbox_inverse')
  let g:gruvbox_inverse=1
endif

if !exists('g:gruvbox_guisp_fallback') || index(['fg', 'bg'], g:gruvbox_guisp_fallback) == -1
  let g:gruvbox_guisp_fallback='NONE'
endif

if !exists('g:gruvbox_termcolors')
  let g:gruvbox_termcolors=256
endif

if !exists('g:gruvbox_invert_indent_guides')
  let g:gruvbox_invert_indent_guides=0
endif

" Palette

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0       = ['#101010', 235]     " 40-40-40
let s:gb.dark0_245   = ['#161616', 236]     " 40-40-40
let s:gb.dark1       = ['#202020', 237]     " 60-56-54
let s:gb.dark2       = ['#303030', 239]     " 80-73-69
let s:gb.dark3       = ['#404040', 241]     " 102-92-84
let s:gb.dark4       = ['#505050', 243]     " 124-111-100
let s:gb.dark4_256   = ['#505050', 243]     " 124-111-100

let s:gb.gray_245    = ['#909090', 245]     " 146-131-116
let s:gb.gray_244    = ['#909090', 244]     " 146-131-116

let s:gb.light0      = ['#d0d0d0', 229]     " 253-244-193
let s:gb.light1      = ['#c0c0c0', 223]     " 235-219-178
let s:gb.light2      = ['#b1b1b1', 250]     " 213-196-161
let s:gb.light3      = ['#b0b0b0', 248]     " 189-174-147
let s:gb.light4      = ['#a0a0a0', 246]     " 168-153-132
let s:gb.light4_256  = ['#a0a0a0', 246]     " 168-153-132

let s:gb.faded_red      = ['#912929', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

" Setup Emphasis

let s:bold = 'bold,'
if g:gruvbox_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:gruvbox_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:gruvbox_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:gruvbox_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:gruvbox_inverse == 0
  let s:inverse = ''
endif

" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

let s:bg0  = s:gb.dark0
let s:bg1  = s:gb.dark1
let s:bg2  = s:gb.dark2
let s:bg3  = s:gb.dark3
let s:bg4  = s:gb.dark4

let s:cursor = s:gb.dark0_245
let s:gray = s:gb.gray_245

let s:fg0 = s:gb.light0
let s:fg1 = s:gb.light1
let s:fg2 = s:gb.light2
let s:fg3 = s:gb.light3
let s:fg4 = s:gb.light4

let s:fg4_256 = s:gb.light4_256

let s:red    = s:gb.faded_red
let s:green  = s:gb.faded_green
let s:yellow = s:gb.faded_yellow
let s:blue   = s:gb.faded_blue
let s:purple = s:gb.faded_purple
let s:aqua   = s:gb.faded_aqua
let s:orange = s:gb.faded_orange

" reset to 16 colors fallback
if g:gruvbox_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.dark0_245 = s:cursor
let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" Setup Terminal Colors For Neovim

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.faded_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.faded_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.faded_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.faded_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.faded_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.faded_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" Overload Setting

let s:hls_cursor = s:orange
if exists('g:gruvbox_hls_cursor')
  let s:hls_cursor = get(s:gb, g:gruvbox_hls_cursor)
endif

let s:number_column = s:none
if exists('g:gruvbox_number_column')
  let s:number_column = get(s:gb, g:gruvbox_number_column)
endif

let s:sign_column = s:none

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:gruvbox_sign_column')
    let s:sign_column = get(s:gb, g:gruvbox_sign_column)
  endif
endif

let s:color_column = s:cursor
if exists('g:gruvbox_color_column')
  let s:color_column = get(s:gb, g:gruvbox_color_column)
endif

let s:vert_split = s:bg0
if exists('g:gruvbox_vert_split')
  let s:vert_split = get(s:gb, g:gruvbox_vert_split)
endif

let s:invert_signs = ''
if exists('g:gruvbox_invert_signs')
  if g:gruvbox_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:gruvbox_invert_selection')
  if g:gruvbox_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:gruvbox_invert_tabline')
  if g:gruvbox_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:gruvbox_italicize_comments')
  if g:gruvbox_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:gruvbox_italicize_strings')
  if g:gruvbox_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" Highlighting Function

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox_guisp_fallback !=? 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox_guisp_fallback ==? 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" Gruvbox Hi Groups

" memoize common hi groups
call s:HL('GruvboxFg0', s:fg0)
call s:HL('GruvboxFg1', s:fg1)
call s:HL('GruvboxFg2', s:fg2)
call s:HL('GruvboxFg3', s:fg3)
call s:HL('GruvboxFg4', s:fg4)
call s:HL('GruvboxGray', s:gray)
call s:HL('GruvboxCursor', s:cursor)
call s:HL('GruvboxBg0', s:bg0)
call s:HL('GruvboxBg1', s:bg1)
call s:HL('GruvboxBg2', s:bg2)
call s:HL('GruvboxBg3', s:bg3)
call s:HL('GruvboxBg4', s:bg4)

call s:HL('GruvboxRed', s:red)
call s:HL('GruvboxRedBold', s:red, s:none, s:bold)
call s:HL('GruvboxGreen', s:green)
call s:HL('GruvboxGreenBold', s:green, s:none, s:bold)
call s:HL('GruvboxYellow', s:yellow)
call s:HL('GruvboxYellowBold', s:yellow, s:none, s:bold)
call s:HL('GruvboxBlue', s:blue)
call s:HL('GruvboxBlueBold', s:blue, s:none, s:bold)
call s:HL('GruvboxPurple', s:purple)
call s:HL('GruvboxPurpleBold', s:purple, s:none, s:bold)
call s:HL('GruvboxAqua', s:aqua)
call s:HL('GruvboxAquaBold', s:aqua, s:none, s:bold)
call s:HL('GruvboxOrange', s:orange)
call s:HL('GruvboxOrangeBold', s:orange, s:none, s:bold)

call s:HL('GruvboxRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GruvboxGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('GruvboxYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GruvboxBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('GruvboxPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GruvboxAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('GruvboxOrangeSign', s:orange, s:sign_column, s:invert_signs)

" Vanilla colorscheme ---------------------------------------------------------
" General UI

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

set background=dark

" Screen line that the cursor is
call s:HL('CursorLine',   s:none, s:cursor)
" Screen column that the cursor is
hi! link CursorColumn CursorLine

" Tab pages line filler
call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
" Active tab page label
call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
" Not active tab page label
hi! link TabLine TabLineFill

" Match paired bracket under the cursor
call s:HL('MatchParen', s:none, s:bg3, s:bold)

" Highlighted screen columns
call s:HL('ColorColumn',  s:none, s:cursor)

" Concealed element: \lambda → λ
call s:HL('Conceal', s:blue, s:none)

" Line number of CursorLine
call s:HL('CursorLineNr', s:yellow, s:cursor)

hi! link NonText GruvboxBg2
hi! link SpecialKey GruvboxBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory GruvboxGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title GruvboxGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg GruvboxYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg GruvboxYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question GruvboxOrangeBold
" Warning messages
hi! link WarningMsg GruvboxRedBold

" Gutter

" Line number for :number and :# commands
call s:HL('LineNr', s:bg1, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:bg1, s:none)
" Column where folds are displayed
call s:HL('FoldColumn', s:bg1, s:none)

" Cursor

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" Syntax Highlighting

hi! link Special GruvboxOrange

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement GruvboxRedBold
" if, then, else, endif, swicth, etc.
hi! link Conditional GruvboxRedBold
" for, do, while, etc.
hi! link Repeat GruvboxRedBold
" case, default, etc.
hi! link Label GruvboxRedBold
" try, catch, throw
hi! link Exception GruvboxRedBold
" sizeof, "+", "*", etc.
hi! link Operator GruvboxRedBold
" Any other keyword
hi! link Keyword GruvboxRedBold

" Variable name
hi! link Identifier GruvboxBlue
" Function name
hi! link Function GruvboxGreenBold

" Generic preprocessor
hi! link PreProc GruvboxAqua
" Preprocessor #include
hi! link Include GruvboxAqua
" Preprocessor #define
hi! link Define GruvboxAqua
" Same as Define
hi! link Macro GruvboxAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit GruvboxAqua

" Generic constant
hi! link Constant GruvboxPurple

" Character constant: 'c', '/n'
hi! link Character GruvboxBlue

" String constant: "this is a string"
call s:HL('String',  s:blue, s:none, s:italicize_strings)

" Boolean constant: TRUE, false
hi! link Boolean GruvboxPurple
" Number constant: 234, 0xff
hi! link Number GruvboxPurple
" Floating point constant: 2.3e10
hi! link Float GruvboxPurple

" Generic type
hi! link Type GruvboxYellowBold
" static, register, volatile, etc
hi! link StorageClass GruvboxYellowBold
" struct, union, enum, etc.
hi! link Structure GruvboxYellowBold
" typedef
hi! link Typedef GruvboxYellowBold

" Treesitter

hi! link TSKeyword GruvboxRedBold
hi! link TSLabel GruvboxPurple
hi! link TSOperator GruvboxRedBold
hi! link TSPunctBracket GruvboxRedBold
hi! link TSPunctDelimiter GruvboxRedBold
hi! link TSPunctSpecial GruvboxRedBold
hi! link TSTagAttribute GruvboxPurple
hi! link TSTagDelimiter GruvboxRedBold

" Completion Menu

" Popup menu: normal item
call s:HL('Pmenu', s:fg1, s:bg2)
" Popup menu: selected item
call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
" Popup menu: scrollbar
call s:HL('PmenuSbar', s:none, s:bg2)
" Popup menu: scrollbar thumb
call s:HL('PmenuThumb', s:none, s:bg4)

" Diffs

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" Spelling

if has('spell')
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" nvim lsp diagnostic {{{

hi! link DiagnosticError GruvboxRed
hi! link DiagnosticWarn GruvboxYellow
hi! link DiagnosticInfo GruvboxGreen
hi! link DiagnosticHint GruvboxBlue

hi! link DiagnosticVirtualTextError GruvboxRed
hi! link DiagnosticVirtualTextWarn GruvboxYellow
hi! link DiagnosticVirtualTextInfo  GruvboxGreen
hi! link DiagnosticVirtualTextHint GruvboxBlue

hi! link DiagnosticFloatingError GruvboxRed
hi! link DiagnosticFloatingWarning GruvboxYellow
hi! link DiagnosticFloatingInfo GruvboxGreen
hi! link DiagnosticFloatingHint GruvboxBlue

hi! link DiagnosticSignError GruvboxRedSign
hi! link DiagnosticSignWarn GruvboxYellowSign
hi! link DiagnosticSignInfo GruvboxGreenSign
hi! link DiagnosticSignHint GruvboxBlueSign

call s:HL('DiagnosticUnderlineError', s:none, s:none, s:undercurl, s:red)
call s:HL('DiagnosticUnderlineWarn', s:none, s:none, s:undercurl, s:yellow)
call s:HL('DiagnosticUnderlineInfo', s:none, s:none, s:undercurl, s:green)
call s:HL('DiagnosticUnderlineHint', s:none, s:none, s:undercurl, s:blue)

hi! link LspCodeLens GruvboxAqua
hi! link LspCodeLensSeparator GruvboxGray

hi! link LspSignatureActiveParameter  GruvboxBlue

" GitGutter

hi! link GitGutterAdd GruvboxGreenSign
hi! link GitGutterChange GruvboxAquaSign
hi! link GitGutterDelete GruvboxRedSign
hi! link GitGutterChangeDelete GruvboxAquaSign

" GitCommit

hi! link gitcommitSelectedFile GruvboxGreen
hi! link gitcommitDiscardedFile GruvboxRed


" Signify

hi! link SignifySignAdd GruvboxGreenSign
hi! link SignifySignChange GruvboxAquaSign
hi! link SignifySignDelete GruvboxRedSign

" Showmarks
hi! link ShowMarksHLl GruvboxRedBold
hi! link ShowMarksHLu GruvboxYellowBold
hi! link ShowMarksHLo GruvboxAquaBold
hi! link ShowMarksHLm GruvboxGreenBold

" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! GruvboxHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! GruvboxHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

