return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"asm", "c", "cmake", "cpp", "make", "nasm",
				"bash",
				"css", "html", "javascript", "scss", "typescript",
				"dockerfile",
				"json", "toml",
				"lua",
				"markdown", "markdown_inline",
				"python",
				"query",
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
