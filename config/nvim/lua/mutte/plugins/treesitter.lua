return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "asm", "c", "cmake", "cpp", "make", "nasm",
                "bash",
                "css", "html", "javascript", "php", "phpdoc", "scss", "typescript",
                "dockerfile",
                "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
                "json", "toml", "xml", "yaml",
                "lua", "luadoc",
                "python",
                "regex",
                "rust",
                "sql",
                "vim", "vimdoc",
                "query",
                "markdown", "markdown_inline"
            },           
            auto_install = false,
            highlight = {
                enable = true, 
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
