
-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true, desc="" }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end


map("i", "jk", "<Esc>", { desc = "Esc" })
map("n", "1", "^", { desc = "Go to beginning of line" })
map("n", "0", "$", { desc = "Go to end of line" })

-- vim.keymap.set("n", "<F5>", ":NvimTreeToggle<CR>", {silent=true})
map("n", "<F5>", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })

-- Move to window using the movement keys
map("n", "<left>", "<C-w>h")
-- map("n", "<down>", "<C-w>j")
-- map("n", "<up>", "<C-w>k")
map("n", "<right>", "<C-w>l")
