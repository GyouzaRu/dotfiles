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

local lsp_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig then
  vim.notify("没有找到 lspconfig")
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
  },
})

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  clangd = require("lsp.config.clangd"),
  cmake = require("lsp.config.cmake"),
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  bashls = require("lsp.config.bash"),
  dockerls = require("lsp.config.docker"),
  pyright = require("lsp.config.pyright"),
  jsonls = require("lsp.config.json"),
  yamlls = require("lsp.config.yamlls"),
  -- remark_ls = require("lsp.config.markdown"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

require("lsp.ui")
