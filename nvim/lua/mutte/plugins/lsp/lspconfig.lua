return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", },
    dependencies = {},

    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true, }
            end,
        })
    end,
}
