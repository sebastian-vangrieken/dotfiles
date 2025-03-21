return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "asm",
                "bash",
                "c",
                "cpp",
                "cmake",
                "lua",
                "rust",
            },
            sync_installed = true,
            auto_install = true,
        })
    end,
}