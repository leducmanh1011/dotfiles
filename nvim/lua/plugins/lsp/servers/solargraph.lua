local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")
    lspconfig.solargraph.setup({})
end

return M
