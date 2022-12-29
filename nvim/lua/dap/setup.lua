local status, dap = pcall(require, "dap")
if not status then
  vim.notify("没有找到 dap")
  return
end
dap.adapters.language = {
}
