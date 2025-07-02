return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
				php = { "pretty-php", "php-cs-fixer" },
				typescript = { "prettier" },
			},
			formatters = {
				["clang-format"] = {
					command = "clang-format",
					args = { "--style={IndentWidth: 4}" },
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
