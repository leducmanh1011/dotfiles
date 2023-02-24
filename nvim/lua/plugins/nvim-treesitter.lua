return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "bash",
          "ruby",
          "lua",
          -- "comment", -- comments are slowing down TS bigtime, so disable for now
          "css",
          -- "gitignore",
          "html",
          "javascript",
          "jsdoc",
          "jsonc",
          "typescript",
          "vim",
          "yaml",
          "json",
        },
        highlight = { enable = true },
        -- indent = { enable = false },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        -- textobjects = {
        --   move = {
        --     enable = true,
        --   },
        -- },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = true, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      }
    end,
  }
}

