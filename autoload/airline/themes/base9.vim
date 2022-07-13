function! AG(fg, bg, extra)
  return [a:fg.hash, a:bg.hash, a:fg.ansi256, a:bg.ansi256, a:extra]
endfunction

function! airline#themes#base9#refresh()
  let palette = {}
  let M = g:base9#colors

  let modified_group = AG(M.green.p100, M.empty, '')
  let modified_group_ia = AG(M.green.p75, M.empty, '')
  let warning_group = AG(M.background, M.yellow.p75, '')
  let error_group = AG(M.background, M.red.p75, '')
  let N1 = AG(M.background, M.primary.p75, '')
  let N2 = AG(M.foreground.p100, M.foreground.p25, '')
  let N3 = AG(M.foreground.p100, M.foreground.p10, '')
  let N4 = AG(M.foreground.p100, M.foreground.p10, '')
  let N5 = AG(M.foreground.p100, M.foreground.p25, '')
  let N6 = AG(M.background, M.primary.p75, '')
  let palette.normal = airline#themes#generate_color_map(N1, N2, N3)
  let palette.normal_modified = { 'airline_c': modified_group }

  let palette.normal.airline_warning = warning_group
  let palette.normal_modified.airline_warning = warning_group
  let palette.normal.airline_error = error_group
  let palette.normal_modified.airline_error = error_group

  let I1 = AG(M.background, M.quote.p75, '')
  let palette.insert = airline#themes#generate_color_map(I1, N2, N3)
  let palette.insert_modified = palette.normal_modified
  let palette.insert.airline_warning = palette.normal.airline_warning
  let palette.insert_modified.airline_warning = palette.normal_modified.airline_warning
  let palette.insert.airline_error = palette.normal.airline_error
  let palette.insert_modified.airline_error = palette.normal_modified.airline_error

  let R1 = AG(M.background, M.match.p75, '')
  let palette.replace = airline#themes#generate_color_map(R1, N2, N3)
  let palette.replace_modified = palette.normal_modified
  let palette.replace.airline_warning = palette.normal.airline_warning
  let palette.replace_modified.airline_warning = palette.normal_modified.airline_warning
  let palette.replace.airline_error = palette.normal.airline_error
  let palette.replace_modified.airline_error = palette.normal_modified.airline_error

  let V1 = AG(M.background, M.selection.p75, '')
  let palette.visual = airline#themes#generate_color_map(V1, N2, N3)
  let palette.visual_modified = { 'airline_c': modified_group }
  let palette.visual.airline_warning = palette.normal.airline_warning
  let palette.visual_modified.airline_warning = palette.normal_modified.airline_warning
  let palette.visual.airline_error = palette.normal.airline_error
  let palette.visual_modified.airline_error = palette.normal_modified.airline_error

  let IA1 = AG(M.background, M.foreground.p50, '')

  let IA2 = AG(M.foreground.p75, M.foreground.p25, '')
  let IA3 = AG(M.foreground.p75, M.foreground.p10, '')
  let palette.inactive = airline#themes#generate_color_map(IA1, IA2, IA3)
  let palette.inactive_modified = { 'airline_c': modified_group_ia }

  let g:airline#themes#base9#palette = palette
  let g:tmp = palette
endfunction

call airline#themes#base9#refresh()
