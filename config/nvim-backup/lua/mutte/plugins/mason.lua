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
				"asm_lsp", -- assembly
				"clangd", -- C/C++
				"eslint", -- html/css/javascript/typescript
				"rust_analyzer", -- rust
				"ts_ls", -- html/css/javascript/typescript
				"pyright", -- python
				--"intelephense",
				"cssls", -- css/scss
				"html", -- html
				"dockerls", -- docker
				"docker_compose_language_service", -- docker-compose
				"tailwindcss", -- css/tailwind
			},
		})

		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier", -- html/css/javascript/typescript
				"stylua", -- lua
				"black", -- python
				"isort", -- python
				"clang-format", -- C/C++
				"cmake_format", -- cmake
				"rustywind", -- rust
			},
		})
	end,
}
