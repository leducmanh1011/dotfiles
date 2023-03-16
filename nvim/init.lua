-- Leader key need loaded before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Import Lua modules
require("config/autocmds")
require("config/keymaps")
require("config/options")
require("config/lazy")

-- vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme monokai]]) --  oxocarbon, tokyonight, gruvbox, rose-pine, monokai

-- Backround transparent
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
