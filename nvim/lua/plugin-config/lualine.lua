-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return
end

local function display_recording_with_noice()
  local status_noice, noice = pcall(require, "noice")
  if status_noice then
    local M = {
      noice.api.statusline.mode.get,
      cond = noice.api.statusline.mode.has,
      color = { fg = "#ff9e64" },
    }
    return M
  else
    return ""
  end
end

lualine.setup({
  options = {
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = " ", right = "" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_c = {
      display_recording_with_noice(),
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = '', -- e712
          dos = '', -- e70f
          mac = '', -- e711
        },
        -- symbols = {
        --   unix = "LF",
        --   dos = "CRLF",
        --   mac = "CR",
        -- },
      },
      "encoding",
      "filetype",
    },
  },
})
