local common = require("lsp.common-config")
local opts = {
  -- cmd = {
  --   -- see clangd --help-hidden
  --   "clangd",
  --   "--background-index",
  --   -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
  --   -- to add more checks, create .clang-tidy file in the root directory
  --   -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
  --   "--clang-tidy",
  --   "--completion-style=bundled",
  --   "--cross-file-rename",
  --   "--header-insertion=iwyu",
  -- },
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
