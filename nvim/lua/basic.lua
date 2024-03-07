-- utf8
vim.opt.encoding = "UTF-8"
-- vim.opt.fileencoding = "UTF-8"
-- jkhl 移动时光标周围保留8行
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- 使用相对行号
vim.opt.number = true
vim.opt.relativenumber = true
-- 高亮所在行
vim.opt.cursorline = true
-- 显示左侧图标指示列
vim.opt.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.opt.colorcolumn = "80"
-- 默认缩进4个空格等于一个Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
-- >> << 时移动长度
vim.opt.shiftwidth = 4
-- 空格替代tab
vim.opt.expandtab = true
-- 新行对齐当前行
vim.opt.autoindent = true
vim.opt.smartindent = true
-- let virtual block move unlimited
vim.opt.virtualedit = "block"
-- 分屏显示操作结果
vim.opt.inccommand = "split"
-- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 搜索要高亮
vim.opt.hlsearch = true
-- 边输入边搜索
vim.opt.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.opt.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
-- 禁止折行
vim.opt.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.opt.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.opt.hidden = true
-- 鼠标支持
vim.opt.mouse = "a"
-- 禁止创建备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
-- smaller updatetime
vim.opt.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.opt.timeoutlen = 500
-- split window 从下边和右边出现
vim.opt.splitbelow = true
vim.opt.splitright = true
-- 自动补全不自动选中
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.opt.background = "dark"
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.opt.list = true
vim.opt.listchars = { trail = "·", tab = "»~" }
-- 补全增强
vim.opt.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.opt.shortmess:append({ c = true })
-- 补全最多显示10行
vim.opt.pumheight = 10
-- 永远显示 tabline
vim.opt.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.opt.showmode = false
-- tags
vim.opt.tags = ("./tags;,tags")
-- sbuffer use window, tab first
vim.opt.switchbuf = "usetab"
-- rg replace grep
if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = "rg --vimgrep --smart-case --follow"
end
-- clipboard
if vim.fn.has('WSL') ~= 1 then
  vim.opt.clipboard = "unnamedplus"
end
-- switchbuf
-- vim.opt.switchbuf = {"usetab", "newtab"}
