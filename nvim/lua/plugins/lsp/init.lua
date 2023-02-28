return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      require("plugins/lsp/mason")
      require("plugins/lsp/mason_lspconfig")
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {"vim"},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }

      require("lspconfig").ruby_ls.setup({})
      require("lspconfig").remark_ls.setup({})
      require("lspconfig").html.setup({})
      require("lspconfig").cssls.setup(
        {
          css = {
            validate = true
          },
          less = {
            validate = true
          },
          scss = {
            validate = true
          }
        }
      )
    end,
  }
}
