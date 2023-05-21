local lsp_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig then
  vim.notify("没有找到 lspconfig")
  return
end


-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  clangd = require("lsp.config.clangd"),
  cmake = require("lsp.config.cmake"),
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  -- rust_analyzer = require("lsp.config.rust");
  bashls = require("lsp.config.bash"),
  dockerls = require("lsp.config.docker"),
  pyright = require("lsp.config.pyright"),
  jsonls = require("lsp.config.json"),
  yamlls = require("lsp.config.yamlls"),
  -- jdtls = require("lsp.config.jdtls"),
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
