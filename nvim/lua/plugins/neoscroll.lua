return {
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup({
            respect_scrolloff = true,
            mappings = {},
        })
    end,
    keys = {
        {
            "<C-d>",
            function()
                require("neoscroll").scroll(vim.wo.scroll, true, 250)
            end,
            desc = "Scroll down",
        },
        {
            "<C-u>",
            function()
                require("neoscroll").scroll(-vim.wo.scroll, true, 250)
            end,
            desc = "Scroll up",
        },
    },
}
