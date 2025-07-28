return {
  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      -- Use fallback colors that work with any colorscheme
      local colors = {
        black = "#000000",
        white = "#ffffff",
        bg_highlight = "#3e4451",
        orange = "#FF8800",
        error = "#ec5f67",
        warning = "#ECBE7B",
        info = "#008080",
        hint = "#51afef",
        purple = "#a9a1e1",
      }

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
      -- Use fallback colors that work with any colorscheme
      local colors = {
        bg_highlight = "#3e4451",
        orange = "#FF8800",
        error = "#ec5f67",
        warning = "#ECBE7B",
        info = "#008080",
        hint = "#51afef",
        purple = "#a9a1e1",
      }

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
  -- show tabline name each file
  {
    "akinsho/bufferline.nvim",
    version = "v4.5.3", -- Pin specific version
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      local status_ok, bufferline = pcall(require, "bufferline")
      if not status_ok then
        return
      end

      bufferline.setup({
        options = {
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          indicator = {
            style = "icon",
            icon = "▎",
          },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          always_show_bufferline = true,
          separator_style = "thin",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
        },
      })

      local map = require("config/keymaps").map
      for n = 1, 9 do
          map("n", "<leader>" .. n, "<CMD>BufferLineGoToBuffer" .. n .. "<CR>", { desc = "Go to Buffer " .. n })
      end

      -- Simple keymaps
      map("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
      map("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    end,
  },
  -- smooth close buffer
  {
    "ojroques/nvim-bufdel",
    config = function()
      require("bufdel").setup({
        next = "tabs",  -- or "cycle", "alternate"
        quit = false,    -- quit Neovim when last buffer is closed
      })

      local map = require("config/keymaps").map

      map("n", "<leader>q", "<CMD>BufDel<CR>", { desc = "Delete the current buffer" })
      map("n", "<leader>Q", "<CMD>BufDel!<CR>", { desc = "Force delete the current buffer" })
    end,
  },
}
