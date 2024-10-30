local M = {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
}

M.config = function()
    require("gruvbox").setup({
        contrast = "medium",
        palette_overrides = {},
        overrides = {},
    })

    vim.cmd("colorscheme gruvbox")
end

return M
