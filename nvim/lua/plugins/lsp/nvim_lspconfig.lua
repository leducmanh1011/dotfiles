require("lspconfig.ui.windows").default_options.border = "rounded"

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 150,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
end

local handlers = {}

local servers = {
  "lua_ls",
  "solargraph",
  "html",
  "tailwindcss",
}

for _, lsp_name in ipairs(servers) do
  local server_config_file = string.format("%s/lua/plugins/lsp/servers/%s.lua", vim.fn.stdpath("config"), lsp_name)
  local file_exists = vim.fn.filereadable(server_config_file) ~= 0
  if file_exists then
    require("plugins.lsp.servers." .. lsp_name).setup({
      capabilities = capabilities,
      flags = flags,
      handlers = handlers,
      on_attach = on_attach,
    })
    -- else
    --     require("plugins.lsp.utils").make_config_fil/'e(lsp_name)
  end
end
