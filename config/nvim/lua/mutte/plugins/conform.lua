return {
	"stevearc/conform.nvim",
	dependencies = {
		"mason.nvim",
		"mason-null-ls.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cmake = { "cmake_format" },
				cpp = { "clang-format" },
				css = { "prettier", "rustywind" },
				html = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
				--php = { "pint", "php_cs_fixer" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				typescript = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
