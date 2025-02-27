return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "cpp", "cmake", "lua", },
            sync_installed = true,
            auto_install = true,
            highlight = { enable = true },
        })
    end,
}
