-- A fancy, configurable, notification manager for NeoVim
return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      timeout = 3000,
      background_colour = "#000000",
      stages = "fade_in_slide_out",
      render = "default",
      max_width = 80,
      max_height = 10,
      on_open = function(win)
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_set_config(win, { zindex = 100 })
        end
      end,
    })
    vim.notify = notify
  end,
}
