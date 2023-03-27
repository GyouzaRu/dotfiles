local status, navi = pcall(require, "nvim-tmux-navigation")
if not status then
  vim.notify("没有找到 nvim-tmux-navigation")
  return
end

navi.setup({
  disable_when_zoomed = true, -- defaults to false
  keybindings = {
    left = "<C-h>",
    down = "<C-j>",
    up = "<C-k>",
    right = "<C-l>",
    last_active = "<C-\\>",
    next = "<C-Space>",
  },
})
