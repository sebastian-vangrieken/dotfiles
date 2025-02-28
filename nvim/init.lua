-- Options --
opt = vim.opt

opt.autoindent = true
opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.cmdheight = 0
opt.confirm = true
opt.cursorline = true
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
map = vim.keymap

map.set("n", "<leader>q", ":q<cr>", { desc = "Quit" })
map.set("n", "<leader>w", ":w<cr>", { desc = "Save" })
map.set("n", "<leader>nh", ":noh<cr>", { desc = "Clear search highlight" })

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
	spec = {},
	checker = { enabled = true },
	change_detection = { notify = false },
})
