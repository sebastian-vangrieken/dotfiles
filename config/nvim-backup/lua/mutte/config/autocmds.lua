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
