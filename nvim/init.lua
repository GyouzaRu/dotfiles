-- basic
require('basic')
-- 键位绑定
require('keybindings')
-- Packer 插件管理
require('plugins')
-- 主题管理
require('colorscheme')
-- 插件配置
require('plugin-config.nvim-tree')
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-surround")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
require("plugin-config.FTerm")

-- LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")

-- DAP
require("dap.config")
