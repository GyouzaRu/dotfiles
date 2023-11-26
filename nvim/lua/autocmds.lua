-- set vifmrc filetype as vim when read it
local api = vim.api
api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = {"vifmrc"}, command = [[:set filetype=vim]]}
)

-- add cursorline
-- api.nvim_create_autocmd(
--   {"WinEnter"},
--   {pattern = {"*"}, command = [[:set cursorline]]}
-- )
-- api.nvim_create_autocmd(
--   {"WinLeave"},
--   {pattern = {"*"}, command = [[:set nocursorline]]}
-- )

-- tags
-- api.nvim_create_autocmd(
--   {"BufNewFile", "BufRead"},
--   {pattern = {"*"}, command = [[:set tags=./.tags;,.tags]]}
-- )

-- auto delete space at the end of line
api.nvim_create_autocmd({"BufWritePre"},{
  pattern = {"*"},
  callback = function()
    if vim.bo.filetype == "markdown" then
      return
    end
    api.nvim_command(":%s/\\s\\+$//e")
  end}
)
-- api.nvim_create_autocmd(
--   {"BufWritePre"},
--   {pattern = {"*"}, command = [[:%s/\s\+$//e]]}
-- )
-- vim.cmd([[
-- autocmd BufRead,BufNewFile * if &ft !=# 'markdown' | :%s/\s\+$//e | endif
-- ]])

-- different autoindent
api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = {"*.lua,.gitconfig"}, command = [[:setlocal tabstop=2 shiftwidth=2 softtabstop=2]]}
)

api.nvim_create_autocmd(
  {"BufNewFile", "BufRead"},
  {pattern = {"*.c,*.cpp,*.cc,*.h,*.hpp"}, command = [[:setlocal equalprg=clang-format]]}
)

-- sava and load fold
api.nvim_create_autocmd(
  {"BufWinLeave"},
  {pattern = {"*.*"}, command = [[:mkview]]}
)
api.nvim_create_autocmd(
  {"BufWinEnter"},
  {pattern = {"*.*"}, command = [[:silent! loadview]]}
)

-- auto inlay hints
api.nvim_create_autocmd({"BufNewFile", "BufRead"},{
  callback = function()
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint(0,true)
    end
  end}
)

-- auto change input method
local input_toggle = 0
function To_en()
  if vim.fn.has("Windows") then
    -- 1033 en; 2052 zh
    local input_method = tonumber(vim.fn.system("/mnt/c/Software/im-select/im-select.exe"))
    if input_method ~= 1033 then
      input_toggle = 1
      vim.fn.system("/mnt/c/Software/im-select/im-select.exe 1033")
    else
      input_toggle = 0
    end
  end
end

function To_zh()
  if vim.fn.has("Windows") then
    if input_toggle == 1 then
      vim.fn.system("/mnt/c/Software/im-select/im-select.exe 2052")
    end
  end
end
api.nvim_create_autocmd(
  {"InsertLeave"},
  {pattern = {"*.*"}, callback = To_en}
  -- {pattern = {"*.*"}, command = "lua To_en()"}
)
api.nvim_create_autocmd(
  {"InsertEnter"},
  {pattern = {"*.*"}, callback = To_zh}
)
