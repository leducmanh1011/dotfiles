local M = {}

-- Require ruby version >= 2.7.0

M.setup = function()
    local lspconfig = require("lspconfig")
    lspconfig.solargraph.setup({
      cmd = { "solargraph", "stdio" },
      filetypes = {"ruby", "rakefile"},
      root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
      settings = {
          solargraph = {
              autoformat = true,
              completion = true,
              diagnostics = true,
              folding = true,
              references = true,
              rename = true,
              symbols = true
          }
      }
    })
end

return M
