
function load()
  local M = vim.g["base9#colors"]

  vim.g.terminal_color_0 = M.ansi.c0.hash
  vim.g.terminal_color_1 = M.ansi.c1.hash
  vim.g.terminal_color_2 = M.ansi.c2.hash
  vim.g.terminal_color_3 = M.ansi.c3.hash
  vim.g.terminal_color_4 = M.ansi.c4.hash
  vim.g.terminal_color_5 = M.ansi.c5.hash
  vim.g.terminal_color_6 = M.ansi.c6.hash
  vim.g.terminal_color_7 = M.ansi.c7.hash
  vim.g.terminal_color_8 = M.ansi.c8.hash
  vim.g.terminal_color_9 = M.ansi.c9.hash
  vim.g.terminal_color_10 = M.ansi.ca.hash
  vim.g.terminal_color_11 = M.ansi.cb.hash
  vim.g.terminal_color_12 = M.ansi.cc.hash
  vim.g.terminal_color_13 = M.ansi.cd.hash
  vim.g.terminal_color_14 = M.ansi.ce.hash
  vim.g.terminal_color_15 = M.ansi.cf.hash
end

return { load = load }
