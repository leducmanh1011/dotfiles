-- A fancy, configurable, notification manager for NeoVim
return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require("notify")
    notify.setup({
      timeout = 3000,
      background_colour = "#000000",
      stages = "fade_in_slide_out",
      render = "minimal",
      max_width = 60,
      max_height = 8,
      minimum_width = 30,
      fps = 30,
      level = 2,
      top_down = true,
    })
    vim.notify = notify
  end,
}
