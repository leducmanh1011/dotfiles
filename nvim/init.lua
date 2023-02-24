-- Leader key need loaded before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Import Lua modules
require("config/lazy")
require("config/keymaps")
require("config/options")

-- vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme monokai]]) --  oxocarbon, tokyonight, gruvbox, rose-pine, monokai
