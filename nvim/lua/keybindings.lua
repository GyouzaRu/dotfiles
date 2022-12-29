-- 复用 map
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 插件快捷键
local pluginKeys = {}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- jk = <esc>
map("i", "jk", "<Esc>", opt)
-- 移动
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)
map("v", "J", "5j", opt)
map("v", "K", "5k", opt)
map("n", "<C-J>", "J", opt)
-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("i", "<C-h>", "<Esc><C-w>h", opt)
map("i", "<C-j>", "<Esc><C-w>j", opt)
map("i", "<C-k>", "<Esc><C-w>k", opt)
map("i", "<C-l>", "<Esc><C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -5<CR>", opt)
map("n", "<C-Right>", ":vertical resize +5<CR>", opt)
map("n", "<C-Down>", ":resize +5<CR>", opt)
map("n", "<C-Up>", ":resize -5<CR>", opt)
-- tab 切换与创建
map("n", "tb", ":tabe<CR>", opt)
-- map("n", "tc", ":tabc<CR>", opt) -- 使用插件vim--bbye
map("n", "<C-b>", ":tabp<CR>", opt)
map("n", "<C-n>", ":tabn<CR>", opt)
map("i", "<C-b>", "<Esc>:tabp<CR>", opt)
map("i", "<C-n>", "<Esc>:tabn<CR>", opt)
-- Terminal相关
map("n", "tt", ":sp | terminal<CR>", opt)
map("n", "tvt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
-- map("v", "J", ":move '>+1<CR>gv-gv", opt)
-- map("v", "K", ":move '<-2<CR>gv-gv", opt)

---- Plugins ----

-- 关闭标签页
-- "moll/vim-bbye"
map("n","tc", ":Bdelete!<CR>", opt)

-- nvim-tree
-- tt 键打开关闭tree
map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "sv", action = "vsplit" },
  { key = "sh", action = "split" },
  -- 新标签打开文件
  { key = "tb", action = "tabnew" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "so", action = "system_open" },
}

-- Float terminal
vim.keymap.set('n', '<A-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
   -- 出现补全
   ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
   -- 取消
   ["<A-,>"] = cmp.mapping({
       i = cmp.mapping.abort(),
       c = cmp.mapping.close()
   }),

    -- Super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, {"i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, {"i", "s"}),
    -- end of super Tab
   -- -- 下一个
   -- ["<Tab>"] = cmp.mapping.select_next_item(),
   -- -- 上一个
   -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),

   -- 确认
   ["<CR>"] = cmp.mapping.confirm({
       select = true,
       behavior = cmp.ConfirmBehavior.Replace
   }),
   -- 如果窗口内容太多，可以滚动
   ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
   ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
  }
end

return pluginKeys


