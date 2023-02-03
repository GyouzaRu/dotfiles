-- set vifmrc filetype as vim when read it
local api = vim.api
api.nvim_create_autocmd(
    {"BufNewFile", "BufRead"},
    {pattern = {"vifmrc"}, command = [[:set filetype=vim]]}
)
-- vim.cmd([[
-- augroup filetypedetect
--    autocmd BufNewFile,BufRead vi?mrc :set filetype=vim
-- augroup END
-- ]])
