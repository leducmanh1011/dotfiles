
-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local M = {}

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true, desc="" }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

M.map = map

map("i", "jj", "<Esc>", { desc = "Esc" })
map("n", "1", "^", { desc = "Go to beginning of line" })
map("n", "0", "$", { desc = "Go to end of line" })

-- vim.keymap.set("n", "<F5>", ":NvimTreeToggle<CR>", {silent=true})
map("n", "<F5>", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })

-- Move to window using the movement keys
map("n", "<leader><left>", "<C-w>h", { desc = "Move to left window" })
-- map("n", "<down>", "<C-w>j")
-- map("n", "<up>", "<C-w>k")
map("n", "<leader><right>", "<C-w>l", { desc = "Move to right window" })

map("n", "<leader>m", ":WhichKey<CR>", { desc = "Show all mappings" })

return M
