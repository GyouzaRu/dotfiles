vim.cmd([[
    let g:nvimgdb_disable_start_keymaps = 1
    let g:nvimgdb_use_find_executables = 0
    let g:nvimgdb_use_cmake_to_find_executables = 0
    let w:nvimgdb_termwin_command = "rightbelow vnew"
    let w:nvimgdb_codewin_command = "vnew"
    let g:nvimgdb_config_override = {
      \ 'key_next': '-n',
      \ 'key_step': '-s',
      \ 'key_finish': '-f',
      \ 'key_continue': '-c',
      \ 'key_until': '-u',
      \ 'key_breakpoint': '-b',
  \ }
]])

local win_ID_code_view
local win_ID_gdb_terminal
local win_ID_local_variable

-- call this when NvimGdbStart
GdbSessionInit = function()
  -- restore breakpoints if possible
  -- local utils = require("user.utils")
  -- if utils.exists('.bps.txt') then
  --   vim.defer_fn(function()
  --     vim.api.nvim_command(":Gdb source .bps.txt")
  --   end, 12000)
  -- end
  -- local utils = require("utils")
  -- if utils.filexist('.bps.txt') then
  --   vim.api.nvim_command("Gdb source .bps.txt")
  -- end

  -- create bt & info locals window
  -- vim.api.nvim_command(":belowright GdbCreateWatch thread apply all bt")
  -- vim.api.nvim_command(":wincmd h")
  vim.o.relativenumber = false
  win_ID_gdb_terminal = vim.api.nvim_get_current_win()

  -- jump to code view
  vim.api.nvim_command("wincmd w")
  win_ID_code_view = vim.api.nvim_get_current_win()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  end

  -- create window to watch local variable
  vim.api.nvim_command("belowright GdbCreateWatch info locals")

  -- go to local variable win
  while vim.api.nvim_get_current_win() == win_ID_code_view or
    vim.api.nvim_get_current_win() == win_ID_gdb_terminal do
    vim.api.nvim_command("wincmd w")
  end

  -- get local variable win ID and set it to 10 height
  win_ID_local_variable = vim.api.nvim_get_current_win()
  vim.api.nvim_command("resize 10")

  -- move cursor back to gdb terminal
  vim.api.nvim_set_current_win(win_ID_gdb_terminal)
end

GdbSessionEnd = function()
  -- if code view is not relativenumber, set to relativenumber
  vim.o.relativenumber = true
end

-- call function
vim.cmd([[
  autocmd User NvimGdbStart :lua GdbSessionInit()
  autocmd User NvimGdbCleanup :lua GdbSessionEnd()
]])
