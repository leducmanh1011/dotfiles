return {
  "folke/which-key.nvim",
  event = "CursorHold",
  config = function()
    require("which-key").setup({
      win = {
        border = "rounded",
        margin = { 0, 0, 2, 0 },
      },
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 10,
        },
      },
    })
  end,
}
