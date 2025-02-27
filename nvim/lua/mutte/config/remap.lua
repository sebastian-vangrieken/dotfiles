vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "Go to file explorer" })

vim.keymap.set("n", "<leader>nh", vim.cmd.noh, { desc = "Clear search highlighting" })

vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { 
    noremap = true, silent = true, desc = "Vertically split window"
})
vim.keymap.set("n", "<leader>ws", ":split<CR>", { 
    noremap = true, silent = true, desc = "Horizontally split window" 
})
vim.keymap.set("n", "<leader>wh", "<C-w>h", { 
    noremap = true, silent = true, desc = "Move to left window"
})
vim.keymap.set("n", "<leader>wj", "<C-w>j", { 
    noremap = true, silent = true, desc = "Move to bottom window"
})
vim.keymap.set("n", "<leader>wk", "<C-w>k", { 
    noremap = true, silent = true, desc = "Move to top window"
})
vim.keymap.set("n", "<leader>wl", "<C-w>l", { 
    noremap = true, silent = true, desc = "Move to right window"
})
vim.keymap.set("n", "<leader>wq", "<C-w>q", { 
    noremap = true, silent = true, desc = "Close current window"
})
