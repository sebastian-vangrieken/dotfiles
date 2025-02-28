-- Options --
vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.autoindent = true
opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.cmdheight = 0
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
	command = ":%s/\\s\\+$//e"
})

-- Plugin manager --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
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
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd[[colorscheme tokyonight-storm]]
			end
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
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
				})
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files"})
			end
		},
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
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    highlight = { enable = true },
                    indent = { enable = true },
                    ensure_installed = {
                        "bash",
                        "c",
                        "cpp",
                        "cmake",
                        "lua",
                        "rust"
                    },
                    sync_installed = true,
                    auto_install = true,
                })
            end
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require("lspconfig")
                lspconfig.clangd.setup({})
                lspconfig.rust_analyzer.setup({})
                local on_attach = function(_,bufnr)
                    local keymap = vim.api.nvim_buf_set_keymap
                    local opts = { noremap = true, silent = true }
                    keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                    keymap(bufnr, "n", "<leader>I", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                end
                lspconfig.clangd.setup({ on_attach = on_attach })
                lspconfig.rust_analyzer.setup({ on_attach = on_attach })
            end
        },
    	checker = { enabled = true },
	    change_detection = { notify = false },
    }
})
