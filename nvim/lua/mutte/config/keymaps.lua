vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap.set

keymap("n", "<leader>q", ":q<cr>", { desc = "Quit" })
keymap("n", "<leader>w", ":w<cr>", { desc = "Save" })
keymap("n", "<leader>nh", ":noh<cr>", { desc = "Clear search highlight" })
keymap("n", "<leader>fe", ":Ex<cr>", { desc = "Go to file explorer" })