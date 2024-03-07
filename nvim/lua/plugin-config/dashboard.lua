local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Projects',
        group = 'Label',
        action = 'Telescope projects',
        key = 'p',
      },
      {
        icon = '󱋡 ',
        icon_hl = '@variable',
        desc = 'Recently Files',
        group = 'Label',
        action = 'Telescope oldfiles',
        key = 'o',
      },
      {
        icon = '󰈔 ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope dotfiles',
        key = 'd',
      },
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
    },
  },
})
