return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.asm_lsp.setup({})
        lspconfig.clangd.setup({
            cmd = { "clangd", "--compile-commands-dir=build" },
        })
        lspconfig.rust_analyzer.setup({})
        local on_attach = function(_, bufnr)
            local keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap = true, silent = true }
            keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
            keymap(bufnr, "n", "<leader>I", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        end
        lspconfig.asm_lsp.setup({ on_attach = on_attach })
        lspconfig.clangd.setup({ on_attach = on_attach })
        lspconfig.rust_analyzer.setup({ on_attach = on_attach })
    end,
}