-- basic
require('basic')
-- 键位绑定
require('keybindings')

-- lazy.nvim 插件管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins-lazy')

-- 主题管理
require('colorscheme')
-- 自动执行vim cmds
require('autocmds')
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
require("plugin-config.gitsigns")

-- LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")

-- DAP
require("dap.setup")
