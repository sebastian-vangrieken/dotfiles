return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local on_attach = function(_, bufnr)
			local keymap = vim.api.nvim_buf_set_keymap
			local opts = { noremap = true, silent = true }
			keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			keymap(bufnr, "n", "<leader>I", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		end

		local servers = {
			asm_lsp = {},
			clangd = { cmd = { "clangd", "--compile-commands-dir=build" } },
			eslint = {},
			rust_analyzer = {},
			ts_ls = {},
			pyright = {},
			--intelephense = {},
			cssls = {},
			html = {},
			dockerls = {},
			docker_compose_language_service = {},
			tailwindcss = {},
		}

		for server, config in pairs(servers) do
			config.on_attach = on_attach
			lspconfig[server].setup(config)
		end
	end,
}
