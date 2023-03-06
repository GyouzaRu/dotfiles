-- set vifmrc filetype as vim when read it
local api = vim.api
api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = {"vifmrc"}, command = [[:set filetype=vim]]}
)

-- add cursorline
api.nvim_create_autocmd(
  {"WinEnter"},
  {pattern = {"*"}, command = [[:set cursorline]]}
)
api.nvim_create_autocmd(
  {"WinLeave"},
  {pattern = {"*"}, command = [[:set nocursorline]]}
)

-- tags
api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = {"*"}, command = [[:set tags=./.tags;,.tags]]}
)

-- auto delete space at the end of line
api.nvim_create_autocmd(
  {"BufWritePre"},
  {pattern = {"*"}, command = [[:%s/\s\+$//e]]}
)

-- different autoindent
api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = {"*.lua"}, command = [[:setlocal tabstop=2 shiftwidth=2 softtabstop=2]]}
)
api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = {"*.lua,.gitconfig"}, command = [[:setlocal tabstop=2 shiftwidth=2 softtabstop=2]]}
)