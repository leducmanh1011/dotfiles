local M = {}

M.setup = function(opts)
    local lspconfig = require("lspconfig")
    lspconfig.solargraph.setup({})
end

return M
