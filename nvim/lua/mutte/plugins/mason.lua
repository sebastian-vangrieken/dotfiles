return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"asm_lsp",
				"clangd",
				"eslint",
				"rust_analyzer",
				"ts_ls",
				"pyright",
				--"intelephense",
				"cssls",
				"html",
				"dockerls",
				"docker_compose_language_service",
				"tailwindcss",
			},
		})

		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"black",
				"isort",
				--"pint",
				"php_cs_fixer",
				"clang-format",
				"cmake_format",
				"rustywind",
			},
		})
	end,
}
