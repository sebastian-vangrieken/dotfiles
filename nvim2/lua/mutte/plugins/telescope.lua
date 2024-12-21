return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 
        "nvim-lua/plenary.nvim",
--        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("telescope").setup({
	})

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })	
    end,
}
