local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
  sources = {
    -- lua
    formatting.stylua,
    -- diagnostics.eslint,
    -- completion.spell,

    -- c/cpp
    formatting.clang_format,
    diagnostics.cppcheck,
  }
})
