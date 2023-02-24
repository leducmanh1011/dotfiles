-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options

-- Neovim UI
opt.mouse = "a"             -- Enable mouse support
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.colorcolumn = "80"      -- Line lienght marker at 80 columns
opt.cursorline = true       -- Hightlight cursor line
opt.showmode = true         -- Show --MODE--
opt.smartcase = true        -- Automatically match case if Capital letters are present
opt.laststatus=3            -- Set global statusline

-- Tabs, indent
opt.expandtab = true        -- Use spaces instead of tabs
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.autoindent = true       -- Uses the indent from the previous line
opt.smartindent = true      -- Autoindent new lines
opt.shiftwidth = 2          -- Shift 2 spaces when tab

-- Memory, CPU
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event
