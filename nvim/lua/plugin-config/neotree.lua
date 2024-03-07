local status, neotree = pcall(require, "neo-tree")
if not status then
  neotree.notify("没有找到 neotree")
  return
end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neotree.setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "double",
  enable_git_status = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    sources = {
      { source = "filesystem", display_name = " 󰉓 Files " },
      { source = "buffers", display_name = " 󱇧 Buffers " },
      -- { source = "git_status", display_name = " 󰊢 Git " },
    }
  },
  open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
  sort_case_insensitive = false,                                     -- used when sorting files and directories in the tree
  sort_function = nil,                                               -- use a custom function for sorting files and directories in the tree
  -- sort_function = function (a,b)
  --       if a.type == b.type then
  --           return a.path > b.path
  --       else
  --           return a.type > b.type
  --       end
  --   end , -- this sorts files and directories descendantly
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      folder_empty_open = "󰜌",
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "*",
      highlight = "NeoTreeFileIcon"
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "", -- this can only be used in the git_status source
        renamed   = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  -- A list of functions, each representing a global custom command
  -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
  -- see `:h neo-tree-global-custom-commands`
  commands = {},
  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = require('keybindings').neotreeList.default,
  },

  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        --"node_modules"
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
        ".gitignore",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        --".DS_Store",
        --"thumbs.db"
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
    follow_current_file = {
      enabled = false, -- This will find and focus the file in the active buffer every
    },
    -- time the current file is changed while the tree is open.
    group_empty_dirs = false,               -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
    window = {
      mappings              = require('keybindings').neotreeList.filesystem,
      fuzzy_finder_mappings = require('keybindings').neotreeList.filesystem.fuzzy_finder_mappings,
    },
    commands = {} -- Add a custom command or override a global one using the same function name
  },
  buffers = {
    follow_current_file = {
      enabled = true   -- This will find and focus the file in the active buffer every
    },
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = require('keybindings').neotreeList.buffer,
    },
  },
  document_symbols = {
    follow_cursor = false,
    client_filters = "first",
    renderers = {
      root = {
        { "indent" },
        { "icon",  default = "C" },
        { "name",  zindex = 10 },
      },
      symbol = {
        { "indent",    with_expanders = true },
        { "kind_icon", default = "?" },
        {
          "container",
          content = {
            { "name",      zindex = 10 },
            { "kind_name", zindex = 20, align = "right" },
          }
        }
      },
    },
  },
})

require('keybindings').neotreeList.functionKeys()
