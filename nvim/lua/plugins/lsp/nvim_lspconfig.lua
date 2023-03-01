require("lspconfig.ui.windows").default_options.border = "rounded"

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 150,
}

local handlers = {}

local servers = {
  "lua_ls",
  "solargraph",
  "html",
}

for _, lsp_name in ipairs(servers) do
    local server_config_file = string.format("%s/lua/plugins/lsp/servers/%s.lua", vim.fn.stdpath("config"), lsp_name)
    local file_exists = vim.fn.filereadable(server_config_file) ~= 0
    if file_exists then
        require("plugins.lsp.servers." .. lsp_name).setup({
            capabilities = capabilities,
            flags = flags,
            handlers = handlers,
            -- on_attach = on_attach,
        })
    -- else
    --     require("plugins.lsp.utils").make_config_fil/'e(lsp_name)
    end
end
