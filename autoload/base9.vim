let s:path = expand('<sfile>:h')
let s:path_colors = s:path . "/../assets/colors.vim"

let s:base9_palette = "282828-ebdbb2-83a598-8ec07c-fe8019-fabd2f-b8bb26-d3869b-fb4934"
if exists("g:base9_palette")
  let s:base9_palette = g:base9_palette
endif

execute 'source ' . s:path_colors

function! base9#RenderPalette(palette)
  silent execute '!' . s:path . "/../assets/base9-builder render " . a:palette . " " . s:path . "/../assets/colors.vim.mustache > " . s:path_colors
endfunction

function! base9#Generate()
  call base9#RenderPalette(s:base9_palette)
  execute 'source ' . s:path_colors
endfunction

function! base9#Development()
  " auto refresh
  autocmd! BufWritePost *
  autocmd BufWritePost * execute "source " . s:path . '/../colors/base9.vim'

  " Output the current syntax group
  nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
endfunction

try
  let s:file = readfile(s:path_colors)
  let s:match = matchstr(s:file[0], tolower(s:base9_palette))
  if s:match == ""
    throw ""
  endif
catch
  call base9#RenderPalette(s:base9_palette)
endtry
