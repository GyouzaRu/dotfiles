local status, term = pcall(require, "FTerm")
if not status then
  vim.notify("没有找到 FTerm.nvim")
  return
end

term.setup({
  border = 'double',
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})
--
-- local lazygit = term:new({
--     ft = 'fterm_lazygit', -- You can also override the default filetype, if you want
--     cmd = "lazygit",
--     dimensions = {
--         height = 0.9,
--         width = 0.9
--     }
-- })
--
-- -- Use this to toggle gitui in a floating terminal
-- vim.keymap.set('n', '<leader>lg', function()
--     lazygit:toggle()
-- end)

require('keybindings').FTerm.functionKeys()
