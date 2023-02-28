return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- disable netrw at the very start of your init.lua (strongly advised)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true
      
      require("nvim-tree").setup({
        auto_reload_on_write = true,
        sort_by = "case_sensitive",
        view = {
          width = 30,
          mappings = {
            list = {
              { key = "u", action = "dir_up" },
              { key = "U", action = "dir_down"},
            },
          },
        },
        renderer = {
          group_empty = true,
          icons = {
            webdev_colors = true,
            git_placement = "before",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "",
              modified = "●",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          }
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons", -- need install Nerd Fonts for display icons
  },
}
