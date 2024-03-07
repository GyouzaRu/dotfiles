local status, surround = pcall(require, "nvim-surround")
if not status then
  vim.notify("没有找到 nvim-surround")
  return
end

local tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    surround.setup({
      -- Configuration here, or leave empty to use defaults
    })
