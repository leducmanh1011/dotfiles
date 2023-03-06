local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  completion = {
      completeopt = "menu,menuone,noselect",
  },
  formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({
              mode = "symbol_text",
              preset = "codicons", -- "default" | "codicons"
              maxwidth = 60,
              menu = {
                  buffer = "[BUFFER]",
                  path = "[PATH]",
                  nvim_lsp = "[LSP]",
                  nvim_lsp_signature_help = "[SIGN]",
                  luasnip = "[SNIP]",
                  nvim_lua = "[NVIM]",
                  cmdline_history = "[HIST]",
                  cmdline = "[CMD]",
                  -- neorg = "[NEORG]",
              },
              symbol_map = {
                --   Copilot = "",
              },
          })(entry, vim_item)
          local strings = vim.split(vim_item.kind, "%s+", { trimempty = true })
          kind.kind = " " .. string.format("[%s] %s", strings[1], strings[2]) .. " "
          return kind
      end,
  },
  snippet = {
      expand = function(args)
          luasnip.lsp_expand(args.body)
      end,
  },
  window = {
      completion = {
          border = "rounded",
          -- Default: winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual",
          col_offset = 0,
          side_padding = 0,
      },
      documentation = {
          border = "rounded",
          -- Default: winhighlight = "FloatBorder:NormalFloat",
          winhighlight = "FloatBorder:FloatBorder",
          zindex = 1001,
      },
  },
  view = {
      entries = {
          name = "custom",
          selection_order = "near_cursor",
      },
  },
  mapping = {},
  sources = {
      -- Order Matters! OR explicitly set priority
      { name = "luasnip", max_item_count = 5 },
      { name = "nvim_lsp", max_item_count = 10 },
      -- { name = "nvim_lsp_signature_help" }, -- handled by noice
      { name = "path", max_item_count = 5 },
      { name = "buffer", max_item_count = 5 },
      -- { name = "neorg" },
  },
})

cmp.setup.cmdline("/", {
  sources = {
      { name = "buffer", max_item_count = 10 },
  },
})

cmp.setup.cmdline(":", {
  sources = {
      { name = "cmdline", max_item_count = 10 },
      { name = "cmdline_history", max_item_count = 5 },
      { name = "nvim_lsp", max_item_count = 10 },
      { name = "path", max_item_count = 5 },
  },
})
