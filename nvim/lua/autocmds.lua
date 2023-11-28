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

-- auto change input method --
if vim.fn.has("wsl") then
  local input_toggle = 0
  local en = 1033
  local zh = 2052
  local im_select = "/mnt/c/Software/im-select/im-select.exe "
  local function To_en(args)
    local input_method = tonumber(vim.fn.system(im_select))
    if input_method ~= en then
      input_toggle = 1
      vim.fn.system(im_select .. en)
    else
      input_toggle = 0
    end
  end

  local function To_zh(args)
    if input_toggle == 1 then
      vim.fn.system(im_select .. zh)
    end
  end

  local ime_input = api.nvim_create_augroup("im_input", {clear = true})
  api.nvim_create_autocmd(
    {"InsertLeave"},
    {pattern = {"*.*"},
      group = ime_input,
      callback = To_en}
  )
  api.nvim_create_autocmd(
    {"InsertEnter"},
    {pattern = {"*.*"},
      group = ime_input,
      callback = To_zh}
  )
end
