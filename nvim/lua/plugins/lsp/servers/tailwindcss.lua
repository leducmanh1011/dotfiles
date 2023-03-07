local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")
    lspconfig.tailwindcss.setup({})
end

return M
