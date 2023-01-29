local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard")
    return
end

db.setup({
    config = {
        theme = 'hyper',
        header = {
            [[]],
            [[]],
            [[          ▀████▀▄▄              ▄█ ]],
            [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
            [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
            [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
            [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
            [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
            [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
            [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
            [[   █   █  █      ▄▄           ▄▀   ]],
            [[]],
            [[]],
        },
        shortcut = {
            {
                desc = "  Projects",
                action = "Telescope projects",
                key = "p",
            },
            {
                desc = "  Recently files",
                action = "Telescope oldfiles",
                key = "rf",
            },
            {
                desc = "  Find file",
                action = "Telescope find_files",
                key = "ff",
            },
            {
                desc = "  Find text",
                action = "Telescope live_grep",
                key = "ft",
            },
            {
                desc = "  Edit keybindings",
                action = "edit ~/.config/nvim/lua/keybindings.lua",
                key = "ek",
            },
        },
        footer = {
            "",
            "",
            "https://github.com/GyouzaRu/MyConfig",
        }
    }
})
