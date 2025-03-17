-- Options --
vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.autoindent = true
opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.wrap = true

-- Keymaps --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap.set

keymap("n", "<leader>q", ":q<cr>", { desc = "Quit" })
keymap("n", "<leader>w", ":w<cr>", { desc = "Save" })
keymap("n", "<leader>nh", ":noh<cr>", { desc = "Clear search highlight" })
keymap("n", "<leader>fe", ":Ex<cr>", { desc = "Go to file explorer" })

-- Auto commands --
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "o", "r" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "asm",
	callback = function()
		vim.bo.filetype = "nasm"
	end,
})

-- Plugin manager --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- Colorscheme
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd([[colorscheme tokyonight-storm]])
			end,
		},
		-- Fuzy Finder
		{
			"nvim-telescope/telescope.nvim",
			event = "VeryLazy",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				local actions = require("telescope.actions")
				require("telescope").setup({
					defaults = {
						mappings = {
							i = {
								["<C-j>"] = actions.move_selection_next,
								["<C-k>"] = actions.move_selection_previous,
							},
						},
					},
					pickers = {
						find_files = {
							hidden = true,
							cwd = vim.fn.expand("%:p:h"),
						},
					},
				})
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", function()
					builtin.find_files({ hidden = true, cwd = vim.fn.expand("%:p:h") })
				end, { desc = "Telescope find files" })
			end,
		},
		-- Automatic Pair
		{
			"echasnovski/mini.pairs",
			event = "VeryLazy",
			config = function()
				require("mini.pairs").setup({
					modes = { insert = true, command = false, terminal = false },
					mappings = {
						["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
						["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
						["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
						['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\]." },
						["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\]." },
						["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\]." },
					},
				})
			end,
		},
		-- Better code
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					highlight = { enable = true },
					indent = { enable = true },
					ensure_installed = {
						"asm",
						"bash",
						"c",
						"cpp",
						"cmake",
						"lua",
						"rust",
					},
					sync_installed = true,
					auto_install = true,
				})
			end,
		},
		-- Mason
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({})
			end,
		},
		-- Lsp
		{
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
		},
		-- Code Formatting
		{
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
		},
		-- Lualine
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("lualine").setup({
					options = {
						theme = "tokyonight",
					},
				})
			end,
		},
		-- UI niceties
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
			config = function()
				require("noice").setup({
					lsp = {
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true,
						},
					},
					presents = {
						bottom_search = true,
						command_palette = true,
						long_message_to_split = true,
						inc_rename = false,
						lsp_doc_border = false,
					},
				})
			end,
		},
		checker = { enabled = true },
		change_detection = { notify = false },
	},
})
