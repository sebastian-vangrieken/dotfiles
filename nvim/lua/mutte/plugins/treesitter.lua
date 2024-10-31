local M = {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "lua",
            },
            highlights = { enable = true, },
            indent = { enable = true, },
        })
    end,
}

return M
