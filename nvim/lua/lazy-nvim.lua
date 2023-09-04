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
    -- {"nvim-tree/nvim-tree.lua",
    --     lazy = true,
    --     -- keys = { {"<leader>n",":NvimTreeToggle<CR>",desc="Nvim-Tree"} },
    --     dependencies = {"nvim-tree/nvim-web-devicons"}},
    -- neotree
    {"nvim-neo-tree/neo-tree.nvim",
        event = 'VimEnter',
        config = function()
            require("plugin-config.neotree")
        end,
        dependencies = {
            -- necessary
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"}},
    -- fm-nbim
    -- {'is0n/fm-nvim',
    --     event = 'VimEnter',
    --     config = function()
    --         require("plugin-config.fm-nvim")
    --     end,},
    -- bufferline
    -- {"akinsho/bufferline.nvim",
    --     event = {'BufNewFile', 'BufReadPre'},
    --     config = function()
    --         require("plugin-config.bufferline")
    --     end,
    --     dependencies = {"moll/vim-bbye" }},
    -- tabline
    -- {"nanozuki/tabby.nvim",
    --     lazy = true},
    -- lualine
    {"nvim-lualine/lualine.nvim",
        event = 'VimEnter',
        config = function()
            require("plugin-config.lualine")
        end,
        dependencies = {"arkav/lualine-lsp-progress"}},

    -- telescope
    {"nvim-telescope/telescope.nvim",
        event = 'VimEnter',
        config = function()
            require("plugin-config.telescope")
        end,
        dependencies = {
            -- necessary
            "nvim-lua/plenary.nvim", }},
    {"ahmedkhalf/project.nvim",
        event = 'VimEnter',
        config = function()
            require("plugin-config.project")
        end,
        dependencies = {"nvim-telescope/telescope.nvim"}},

    -- dashboard-nvim
    { "glepnir/dashboard-nvim",
        event = 'VimEnter',
        config = function()
            require("plugin-config.dashboard")
        end,
    dependencies = {"nvim-tree/nvim-web-devicons"}},
    -- treesitter
    {"nvim-treesitter/nvim-treesitter",
        event = {'BufNewFile', 'BufReadPre'},
        config = function()
            require("plugin-config.nvim-treesitter")
        end,
        -- cmd = "TSUpdate"
    },
  -- surround
    {"kylechui/nvim-surround",
        event = {'BufNewFile', 'BufReadPre'},
        config = function()
            require("plugin-config.nvim-surround")
        end,
        lazy=true},
    -- nvim-autopairs
    {"windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugin-config.nvim-autopairs")
        end,
        },

    -- comment
    {"numToStr/Comment.nvim",
        event = {'BufNewFile', 'BufReadPre'},
        config = function()
            require("plugin-config.comment")
        end,
        },
    -- Float terminal
    {"numToStr/FTerm.nvim",
        event = 'VimEnter',
        config = function()
            require("plugin-config.FTerm")
        end,
        },
    -- git sign
    {"lewis6991/gitsigns.nvim",
        event = {'BufNewFile', 'BufReadPre'},
        config = function()
            require("plugin-config.gitsigns")
        end,
        },
  -- navi with tmux
    {"alexghergh/nvim-tmux-navigation",
        event = 'VimEnter',
        config = function()
            require("plugin-config.nvim-tmux-navigation")
        end,
      },
    -- indent blank line
    -- {"lukas-reineke/indent-blankline.nvim",
    --     event = {'BufNewFile', 'BufReadPre'},
    --     config = function()
    --         require("plugin-config.indent-blankline")
    --     end,
    --   },

    -- view symbols based on LSP
    {"simrat39/symbols-outline.nvim",
        event = {'BufNewFile', 'BufReadPre'},
        config = function()
            require("plugin-config.symbols-outline")
        end,
      },
    -- message UI
    -- {"folke/noice.nvim",
    --     event = 'VimEnter',
    --     config = function()
    --         require("plugin-config.noice")
    --     end,
    --     dependencies = {
    --       "MunifTanjim/nui.nvim",
    --       -- "rcarriga/nvim-notify"
    -- }},

    -- Lspconfig
    {"neovim/nvim-lspconfig",
        -- event = 'VimEnter',
        event = {'BufNewFile', 'BufReadPre'},
        config = function()
            require("lsp.setup")
            require("lsp.ui")
        end,
        -- lazy = true
    },
    -- mason !!! Lazy-loading mason is not recommended
    {"williamboman/mason.nvim",
        -- event = 'VimEnter',
        config = function()
            require("plugin-config.mason")
        end,
        -- lazy = true
    },
    {"williamboman/mason-lspconfig.nvim",
        -- event = 'VimEnter',
    },
    -- -- No update
    -- {"jose-elias-alvarez/null-ls.nvim",
    --     event = 'VimEnter',
    --     config = function()
    --         require("plugin-config.null-ls")
    --     end,
    --     },

    {"hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "VimEnter",
        config = function()
            require("lsp.cmp")
        end,
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
        event = {'BufNewFile', 'BufReadPre'},
        dependencies = {
            -- snippet 引擎
            "hrsh7th/vim-vsnip",
        },
      },

    -- Debugger

    {"sakhnik/nvim-gdb",
        -- event = {'BufNewFile', 'BufReadPre'},
        ft = {'cpp', 'c', 'sh', 'python'},
        config = function()
            require("plugin-config.nvim-gdb")
        end,
    },
    {"mfussenegger/nvim-dap",
        lazy = true,
        config = function()
            require("dap.setup")
        end,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        }
    },
})
