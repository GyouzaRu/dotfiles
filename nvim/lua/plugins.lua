local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use('wbthomason/packer.nvim')

    -- 你的插件列表...
    ---- colorschemes ----
    -- tokyonight
    use({"folke/tokyonight.nvim"})
    ---- plugins ----
    -- nvim-tree
    use({"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}})
    -- bufferline
    use({"akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({"nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({"nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }})
    -- dashboard-nvim
    use({ "glepnir/dashboard-nvim"})
    -- project
    use({ "ahmedkhalf/project.nvim"})
    -- treesitter
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- surround
    use({"kylechui/nvim-surround"})
    -- nvim-autopairs
    use({"windwp/nvim-autopairs"})
    -- comment
    use({"numToStr/Comment.nvim"})
    -- Float terminal
    use({"numToStr/FTerm.nvim"})

    -- mason
    use({"williamboman/mason.nvim" })
    use({"williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({"neovim/nvim-lspconfig" })

    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
  end,

  config = {
    -- 并发数限制
    max_jobs = 16,

    -- 浮动窗口
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },

    -- 自定义源(连接不上github时的代理站点，一般不用)
    git = {
--      -- default_url_format = "https://hub.fastgit.xyz/%s",
--      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
--      -- default_url_format = "https://gitcode.net/mirrors/%s",
--      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
