return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      messages = { enabled = true },
      notify = { enabled = true },
      lsp = {
        progress = { enabled = false },
        documentation = {
          opts = {
            border = { style = "rounded" },
            position = {
              row = 2,
            },
            win_options = {
              winhighlight = {
                NormalFloat = "Normal",
              },
            },
          },
        },
        signature = { enabled = false }, -- Disable to avoid conflicts
        hover = { enabled = true },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "30%",
            col = "50%",
          },
          size = {
            width = "auto",
            height = "auto",
          },
        },
      },
      routes = {
        -- Hide written, more/less lines, lines changed, etc messages
        {
          filter = {
            event = "msg_show",
            kind = "",
            any = {
                { find = "written" },
                { find = "%d change" },
                { find = "%d more lines?" },
                { find = "%d fewer lines?" },
                { find = "%d lines? less" },
            },
          },
          opts = { skip = true },
        },
        -- Hide search count messages
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
    })
  end,
}
