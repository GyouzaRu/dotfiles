-- basic
require('basic')
-- 键位绑定
require('keybindings')
-- 自动执行vim cmds
require('autocmds')
-- require('usercmds')

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

require('lazy-nvim')

-- 主题管理
require('colorscheme')
