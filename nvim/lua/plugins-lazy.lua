local status, lazy = pcall(require, "lazy")
if not status then
    vim.notify("没有找到 lazy.nvim")
    return
end

lazy.setup({
    -- 你的插件列表...
    ---- colorschemes ----
    -- tokyonight
    {"folke/tokyonight.nvim",
        lazy = false,
        priority = 1000},
    {"catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000},
    ---- plugins ----
    -- nvim-tree
    {"nvim-tree/nvim-tree.lua",
        lazy = true,
        -- keys = { {"<leader>n",":NvimTreeToggle<CR>",desc="Nvim-Tree"} },
        dependencies = {"nvim-tree/nvim-web-devicons"}},
    -- bufferline
    {"akinsho/bufferline.nvim",
        lazy = true,
        dependencies = {"moll/vim-bbye" }},
    -- lualine
    {"nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = {"arkav/lualine-lsp-progress"}},
    -- telescope
    {"nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
            -- necessary
            "nvim-lua/plenary.nvim",
            -- project search
            "ahmedkhalf/project.nvim"}},
    -- dashboard-nvim
    { "glepnir/dashboard-nvim",
        lazy = true},
    -- treesitter
    {"nvim-treesitter/nvim-treesitter",
        lazy = true,
        cmd = "TSUpdate" },
    -- surround
    {"kylechui/nvim-surround",
        lazy=true},
    -- nvim-autopairs
    {"windwp/nvim-autopairs",
        lazy=true},
    -- comment
    {"numToStr/Comment.nvim",
        lazy=true},
    -- Float terminal
    {"numToStr/FTerm.nvim",
        lazy = true},
    -- git sign
    {"lewis6991/gitsigns.nvim",
        lazy = false},
    -- view symbols based on LSP
    {"simrat39/symbols-outline.nvim",
        lazy = true},

    -- mason
    {"williamboman/mason.nvim",
        lazy = true},
    {"williamboman/mason-lspconfig.nvim",
        lazy = true},
    -- Lspconfig
    {"neovim/nvim-lspconfig",
        lazy = true},

  -- navi with tmux
    {"alexghergh/nvim-tmux-navigation",
        lazy = true},

    {"hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            -- snippet 引擎
            "hrsh7th/vim-vsnip",
            -- 补全源
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
            "hrsh7th/cmp-buffer", -- { name = 'buffer' },
            "hrsh7th/cmp-path", -- { name = 'path' }
            "hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
        },
    },
    -- 常见编程语言代码段
    { "rafamadriz/friendly-snippets",
        lazy=true},

    -- Debugger
    {"mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        }
    },
})
