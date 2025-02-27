vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>nh", vim.cmd.noh)

vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ws", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true})
