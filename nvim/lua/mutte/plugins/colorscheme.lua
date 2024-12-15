return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "dark",
            terminal_colors = true,
            palette_overrides = {},
            overrides = {},
        })
        vim.cmd("colorscheme gruvbox")
    end,
}
