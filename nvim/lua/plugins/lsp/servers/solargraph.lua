local M = {}

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
              diagnostic = true,
              folding = true,
              references = true,
              rename = true,
              symbols = true
          }
      }
    })
end

return M
