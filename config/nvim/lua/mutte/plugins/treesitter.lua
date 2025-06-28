return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"asm", "nasm", "c", "cpp", "cmake", "make",
				"bash",
				"html", "css", "scss", "javascript", "typescript", "php", "blade",
				"dockerfile",
				"json", "toml",
				"lua",
				"markdown", "markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"sql",
				"vim", "vimdoc",
			},
			auto_install = false,
			highlight = {
				enable = true,
			},
		})
	end,
}
