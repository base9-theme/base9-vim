let s:path = expand('<sfile>')
let M = g:base9#colors
let s:M = M

hi clear
if exists("syntax_on")
  syntax reset
endif


let bold = 'bold,'
let italic = 'italic,'
let underline = 'underline,'
let undercurl = 'undercurl,'
let inverse = 'inverse,'


let g:colors_name='base9'

" ------------------ Helpers

function! HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let l:bg = a:1
  else
    let l:bg = s:M.none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    " if g:gruvbox_guisp_fallback != 'NONE'
    "   let fg = a:3
    " endif

    " bg fallback mode should invert higlighting
    " if g:gruvbox_guisp_fallback == 'bg'
    "   let emstr .= 'inverse,'
    " endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . a:fg.hash,
        \ 'guibg=' . l:bg.hash,
        \ 'ctermfg=' . a:fg.ansi256,
        \ 'ctermbg=' . l:bg.ansi256,
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3.hash)
  endif

  execute join(histring, ' ')
endfunction

" Might not need this
" function! LN(group, group2)
"   execute 'hi! link' . a:group . ' ' . a:group2
" endfunction




if has('nvim')
  " lua require('tokyonight').colorscheme()
  lua package.loaded['base9'] = nil
  lua require('base9').load()
endif

" Basic
call HL('Normal',         M.foreground.p100,   M.background)
call HL('Visual',         M.none, M.selection.p25)

" Diff
call HL('DiffAdd',         M.none,                 M.green.p25)
call HL('DiffChange',         M.none,                 M.yellow.p25)
call HL('DiffDelete',         M.none,                 M.red.p25)

" Cursor
call HL('Cursor',         M.green.p100,                 M.foreground.p100)
call HL('TermCursor',         M.green.p100,                 M.foreground.p100)
call HL('TermCursorNC',         M.green.p100,                 M.foreground.p100)
call HL('CursorLine',   M.none,                 M.foreground.p10)
call HL('CursorColumn',   M.none,                 M.foreground.p10)

" TabLine
call HL('TabLine',        M.foreground.p75,    M.foreground.p10)
call HL('TabLineFill',    M.foreground.p75,    M.foreground.p10)
call HL('TabLineSel',     M.foreground.p100,   M.background)
call HL('Title',     M.foreground.p100,   M.none, bold)

" StatusLine
call HL('StatusLine',   M.foreground.p100, M.primary.p25, bold)
call HL('StatusLineNC',   M.foreground.p100, M.primary.p25)

" Spell
call HL('SpellBad',  M.none, M.none, 'undercurl,', M.red.p100)
call HL('SpellCap',  M.none, M.none, 'undercurl,', M.yellow.p100)
call HL('SpellLocal',  M.none, M.none, 'undercurl,', M.yellow.p100)
call HL('SpellRare',  M.none, M.none, 'undercurl,', M.yellow.p100)


" Search
call HL('Search',     M.none,   M.match.p25)
call HL('IncSearch',     M.none,   M.match.p25,     bold)
call HL('MatchParen',     M.none,                 M.highlight.p25)
" call HL('MatchParen',     M.none,                 M.highlight.p50)
" call HL('MatchParen',     M.background,        M.highlight.p75)
" call HL('MatchParen',     M.background,        M.highlight.p100)

" Line Number
call HL('CursorLineNr',     M.foreground.p100,   M.foreground.p10)
call HL('LineNr', M.foreground.p75, M.foreground.p10)

" Syntax
call HL('Comment', M.foreground.p75)
call HL('String', M.string.p100)
call HL('Character', M.operator.p100)
call HL('Constant', M.literal.p100)
call HL('Function', M.function.p100)
call HL('Identifier', M.variable.p100)
call HL('Statement', M.keyword.p100)
call HL('PreProc', M.decorator.p100)
call HL('type', M.keyword.p100)

call HL('Special', M.primary.p100) " group
call HL('SpecialChar', M.escape.p100) " escape character
call HL('Tag', M.link.p100) " vim tag
call HL('Delimiter', M.foreground.p100) " built-in operator

call HL('Underlined', M.link.p100, M.none, underline)
call HL('Error', M.red.p100)
call HL('Todo', M.foreground.p100, M.none, bold)

" Pmenu
call HL('Pmenu', M.foreground.p100, M.foreground.p10)
call HL('PmenuSel', M.foreground.p100, M.highlight.p25)
call HL('PmenuSbar', M.foreground.p100, M.foreground.p25)
call HL('PmenuThumb', M.foreground.p100, M.foreground.p50)

" MsgArea
call HL('ErrorMsg', M.red.p100)
call HL('WarningMsg', M.yellow.p100)
call HL('ModeMsg', M.secondary.p100)
call HL('WildMenu', M.background, M.primary.p100, bold) " TODO
call HL('Question', M.primary.p100, M.none)

" TODO call HL('MsgSeparator', M.red.p50, M.red.p100)
" TODO call HL('QuickFixLine', M.primary.p100)


" Other

call HL('Conceal',        M.operator.p100,                 M.none)
call HL('ColorColumn',    M.none,                 M.foreground.p10)
call HL('VertSplit',    M.divider.p75,                 M.divider.p10)
call HL('Folded', M.none, M.fold.p25)
hi! link FoldColumn Folded
call HL('SignColumn', M.foreground.p100, M.foreground.p10)
call HL('NonText', M.foreground.p50)

