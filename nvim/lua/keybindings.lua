-- 复用 map
local map = vim.keymap.set
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 插件快捷键
local pluginKeys = {}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reload config
map("n", "<leader>R", ":w<CR>:luafile %<CR>", opt)

-- jk = <esc>
map("i", "jk", "<Esc>", opt)
-- 移动
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)
map("n", "H", "^", opt)
map("n", "L", "$", opt)
map("v", "J", "5j", opt)
map("v", "K", "5k", opt)
map("v", "H", "^", opt)
map("v", "L", "$", opt)
map("o", "H", "^", opt)
map("o", "L", "$", opt)
map("n", "<leader>j", "J", opt)
-- 取消高亮
map("n", "<leader><CR>", ":nohl<CR>", opt)
-- win 分屏快捷键
map("n", "<leader>-", "<C-w>s", opt)
map("n", "<leader>=", "<C-w>v", opt)
map("n", "<leader><BS>", "<C-w>c", opt)
-- 关闭当前
-- map("n", "<leader>c", "<C-w>c", opt)
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
-- if packer_plugins["bufferline.nvim"] and packer_plugins["bufferline.nvim"].loaded then
-- map("n", "[t", ":bprevious<CR>", opt)
-- map("n", "]t", ":bnext<CR>", opt)
--     print("loaded!")
-- else
--     print("unloaded!")
-- map("n", "[t", ":tabp<CR>", opt)
-- map("n", "]t", ":tabn<CR>", opt)
-- end
map("n", "[t", ":tabp<CR>", opt)
map("n", "]t", ":tabn<CR>", opt)
-- buffer 切换
map("n", "[b", ":bprevious<CR>", opt)
map("n", "]b", ":bnext<CR>", opt)
-- Terminal相关
map("t", "<C-\\><C-\\>", "<C-\\><C-n>", opt)
-- map('n', '<C-q>', '<CMD>TermToggle<CR>')
-- map('t', '<C-q>', '<C-\\><C-n><CMD>TermToggle<CR>')
-- map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
-- map("v", "J", ":move '>+1<CR>gv-gv", opt)
-- map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- jump to tag
map("n", "<C-w><C-]>", ":vsp<CR><C-]>")
map("n", "<C-w>]", ":sp<CR><C-]>")
-- copy to register
map("n", "<leader>0p", "\"0p")
map("v", "<leader><leader>y", "\"+y")
map("n", "<leader><leader>p", "\"+p")
-- quickfix
map("n", "[q", ":cprevious<CR>", opt)
map("n", "]q", ":cnext<CR>", opt)

---- Plugins ----

-- 关闭标签页
-- "moll/vim-bbye"
-- map("n","tc", ":Bdelete!<CR>", opt)

-- nvim-tree
-- tt 键打开关闭tree
-- map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
-- pluginKeys.nvimTreeList = {
--   { key = "J", action = "" },
--   { key = "K", action = "" },
--   { key = "H", action = "" },
--   { key = {"<CR>", "o", "l", "<2-LeftMouse>"}, action = "edit" },
--   { key = {"O", "go"}, action = "edit_no_picker" },
--   { key = "sv", action = "vsplit" },
--   { key = "sh", action = "split" },
--   { key = "tb", action = "tabnew" },
--   { key = "h", action = "close_node" },
--   { key = "cw", action = "rename" },
--   { key = "R", action = "refresh" },
--   { key = "a", action = "create" },
--   { key = "x", action = "cut" },
--   { key = "y", action = "copy" },
--   { key = "p", action = "paste" },
--   { key = "so", action = "system_open" },
--   -- 显示隐藏文件
--   { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
--   { key = { "za" , "."}, action = "toggle_dotfiles" }, -- Hide (dotfiles)
-- }

-- neo-tree
map("n", "<leader>n", "<CMD>Neotree toggle<CR>", opt)
-- map("n", "<leader>b", "<CMD>Neotree buffers toggle<CR>", opt)
pluginKeys.neotreeList = {
  default = {
    ["<space>"] = {
      "toggle_node",
      nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
    },
    ["<2-LeftMouse>"] = "open",
    -- ["<cr>"] = "open",
    ["l"] = "open",
    ["<esc>"] = "revert_preview",
    ["P"] = { "toggle_preview", config = { use_float = true } },
    -- ["l"] = "focus_preview",
    ["S"] = "open_split",
    ["-"] = "open_split",
    ["s"] = "open_vsplit",
    ["="] = "open_vsplit",
    -- ["S"] = "split_with_window_picker",
    -- ["s"] = "vsplit_with_window_picker",
    ["t"] = "open_tabnew",
    -- ["<cr>"] = "open_drop",
    -- ["t"] = "open_tab_drop",
    ["w"] = "open_with_window_picker",
    --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
    ["h"] = "close_node",
    -- ['C'] = 'close_all_subnodes',
    ["H"] = "close_all_nodes",
    ["L"] = "expand_all_nodes",
    --["Z"] = "expand_all_nodes",
    ["z"] = "",
    ["a"] = {
      "add",
      -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
      -- some commands may take optional config options, see `:h neo-tree-mappings` for details
      config = {
        show_path = "none" -- "none", "relative", "absolute"
      }
    },
    ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
    ["d"] = "delete",
    ["c"] = "rename",
    ["y"] = "copy_to_clipboard",
    ["x"] = "cut_to_clipboard",
    ["p"] = "paste_from_clipboard",
    -- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
    -- ["c"] = {
    --  "copy",
    --  config = {
    --    show_path = "none" -- "none", "relative", "absolute"
    --  }
    --}
    ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
    ["q"] = "close_window",
    ["r"] = "refresh",
    ["?"] = "show_help",
    ["<"] = "prev_source",
    [">"] = "next_source",
  },
  filesystem = {
    ["<bs>"] = "navigate_up",
    -- ["<cr>"] = "set_root",
    ["."] = "set_root",
    -- ["H"] = "toggle_hidden",
    ["za"] = "toggle_hidden",
    ["/"] = "fuzzy_finder",
    ["D"] = "fuzzy_finder_directory",
    ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
    -- ["D"] = "fuzzy_sorter_directory",
    ["f"] = "filter_on_submit",
    ["<c-x>"] = "clear_filter",
    ["[g"] = "prev_git_modified",
    ["]g"] = "next_git_modified",
  },
  fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
    ["<down>"] = "move_cursor_down",
    ["<C-n>"] = "move_cursor_down",
    ["<C-j>"] = "move_cursor_down",
    ["<up>"] = "move_cursor_up",
    ["<C-p>"] = "move_cursor_up",
    ["<C-k>"] = "move_cursor_up",
  },
  buffer = {
    ["bd"] = "buffer_delete",
    ["<bs>"] = "navigate_up",
    ["."] = "set_root",
    ["S"] = "open_split",
    ["s"] = "open_vsplit",
    ["t"] = "open_tabnew",
  }
}

-- Float terminal
map('n', '<C-q>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<C-q>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Gitsigns
pluginKeys.gitsigns = function(bufnr)
  local gs = package.loaded.gitsigns

  local function gitsign_map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    map(mode, l, r, opts)
  end

  -- Navigation
  gitsign_map('n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end, { expr = true })

  gitsign_map('n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end, { expr = true })

  -- Actions
  -- gitsign_map('n', '<leader>hs', gs.stage_hunk)
  -- gitsign_map('n', '<leader>hr', gs.reset_hunk)
  -- gitsign_map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
  -- gitsign_map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
  -- gitsign_map('n', '<leader>hS', gs.stage_buffer)
  -- gitsign_map('n', '<leader>hu', gs.undo_stage_hunk)
  -- gitsign_map('n', '<leader>hR', gs.reset_buffer)
  gitsign_map('n', '<leader>cc', gs.preview_hunk)
  gitsign_map('n', '<leader>cb', function() gs.blame_line { full = true } end)
  gitsign_map('n', '<leader>ct', gs.toggle_current_line_blame)
  gitsign_map('n', '<leader>cd', gs.diffthis)
  -- gitsign_map('n', '<leader>hD', function() gs.diffthis('~') end)
  -- gitsign_map('n', '<leader>td', gs.toggle_deleted)

  -- Text object
  -- gitsign_map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

-- tags
map("n", "<leader>t", "<cmd>SymbolsOutline<CR>", opt)

-- Debugger
map({ "i", "n", "v" }, "<F5>", "<cmd>lua require'dap'.continue()<CR>", opt)
map({ "i", "n", "v" }, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opt)
map({ "i", "n", "v" }, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opt)
map({ "i", "n", "v" }, "<F12>", "<cmd>lua require'dap'.step_over()<CR>", opt)
map({ "i", "n", "v" }, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)
map("n", "<leader>b", ":Telescope buffers<CR>", opt)
map("n", "<leader>o", ":Telescope oldfiles<CR>", opt)
-- map("n", "sh", ":Telescope help_tags<CR>", opt)
-- map("n", "st", ":Telescope tags<CR>", opt)
-- project插件
map("n", "<leader>p", ":Telescope projects<CR>", opt)

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
    ["<M-->"] = "select_horizontal",
    ["<M-=>"] = "select_vertical",
  },
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition({reuse_win=true})<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader><leader>=", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
  mapbuf("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
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
    -- ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- -- 取消
    -- ["<A-,>"] = cmp.mapping({
    --   i = cmp.mapping.abort(),
    --   c = cmp.mapping.close()
    -- }),

    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end, { "i", "c" }),

    -- Super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
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
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  }
end

return pluginKeys
