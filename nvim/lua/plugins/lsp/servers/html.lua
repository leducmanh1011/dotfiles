local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")
    lspconfig.html.setup({})
end

return M
