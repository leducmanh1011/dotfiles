-- Leader key need loaded before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Import Lua modules
require("config/options")
require("config/keymaps")
require("config/autocmds")
require("config/lazy")

vim.o.background = "dark" -- "dark" or "light" for light mode

-- Load colorscheme after plugins
vim.schedule(function()
  vim.cmd([[colorscheme monokai]]) --  monokai, oxocarbon, tokyonight, gruvbox, rose-pine, monokai

  -- Background transparent
  -- vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
end)
