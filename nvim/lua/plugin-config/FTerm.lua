local status, term = pcall(require, "FTerm")
if not status then
    vim.notify("没有找到 FTerm.nvim")
    return
end

term.setup({
    border = 'double',
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
})
