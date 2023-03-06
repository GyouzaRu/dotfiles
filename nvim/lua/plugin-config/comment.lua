local status, comment = pcall(require, "Comment")
if not status then
  vim.notify("没有找到 comment")
  return
end

comment.setup()
