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

-- LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
