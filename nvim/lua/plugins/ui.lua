return {
  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
            InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
   -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      local colors = require("tokyonight.colors").setup()
      scrollbar.setup({
        handle = { color = colors.bg_highlight },
        excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
  },
  -- auto-resize windows
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = false },
    },
    keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup({
        animation = { enable = false, duration = 150 },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
            numbers = "ordinal",
            -- Only show if more than 2 buffers (needed for dashboard)
            always_show_bufferline = false,
            show_buffer_close_icons = true,
            show_close_icon = true,
            offsets = {
              {
                filetype = "NvimTree",
                text = "File Explorer", -- "File Explorer" | function ,
                text_align = "center",
                separator = true,
              },
            },
        },
        -- highlights = require("catppuccin.groups.integrations.bufferline").get({})(),
      })

      local map = require("config/keymaps").map
      for n = 1, 9 do
          map("n", "<leader>" .. n, "<CMD>BufferLineGoToBuffer" .. n .. "<CR>", { desc = "Go to Buffer " .. n })
      end
    end,
  }
}
