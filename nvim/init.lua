-- basic
require('basic')
-- keybindings
require('keybindings')
-- custom commands
require('autocmds')
require('usercmds')

-- lazy.nvim plugins management
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

-- GUI support
require('gui')
