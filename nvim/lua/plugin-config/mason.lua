local mason_status, mason = pcall(require, "mason")
if not mason_status then
  vim.notify("没有找到 mason")
  return
end

local mason_config_status, mason_config = pcall(require, "mason-lspconfig")
if not mason_config_status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

-- :h mason-default-settings
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "clangd",
    "cmake",
    "lua_ls",
    "bashls",
    "dockerls",
    "pyright",
    "jsonls",
    "yamlls",
    -- "jdtls",
  },
})
