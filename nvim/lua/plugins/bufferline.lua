return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  enabled = true,
  lazy = false,
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        sort_by = "id",
      },
    })

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>1", "<CMD>BufferLineGoToBuffer 1<CR>", { desc = "Go to Buffer 1" })
    map("n", "<leader>2", "<CMD>BufferLineGoToBuffer 2<CR>", { desc = "Go to Buffer 2" })
    map("n", "<leader>3", "<CMD>BufferLineGoToBuffer 3<CR>", { desc = "Go to Buffer 3" })
    map("n", "<leader>4", "<CMD>BufferLineGoToBuffer 4<CR>", { desc = "Go to Buffer 4" })
    map("n", "<leader>5", "<CMD>BufferLineGoToBuffer 5<CR>", { desc = "Go to Buffer 5" })
    map("n", "<leader>6", "<CMD>BufferLineGoToBuffer 6<CR>", { desc = "Go to Buffer 6" })
    map("n", "<leader>7", "<CMD>BufferLineGoToBuffer 7<CR>", { desc = "Go to Buffer 7" })
    map("n", "<leader>8", "<CMD>BufferLineGoToBuffer 8<CR>", { desc = "Go to Buffer 8" })
    map("n", "<leader>9", "<CMD>BufferLineGoToBuffer 9<CR>", { desc = "Go to Buffer 9" })
  end,
}
