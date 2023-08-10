local status, blankline = pcall(require, "indent_blankline")
if not status then
  vim.notify("没有找到 indent-blankline")
  return
end

blankline.setup{
  show_end_of_line = true,
  show_foldtext = false
}
