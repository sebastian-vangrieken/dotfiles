return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = "BufReadPre",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                rust = { "rustfmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
}