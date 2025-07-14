return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function()
			vim.lsp.config("lua_ls", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
				settings = {
					Lua = {},
				},
			})
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
			})
			-- local triggers = { "." }
			-- vim.api.nvim_create_autocmd("InsertCharPre", {
			-- 	buffer = vim.api.nvim_get_current_buf(),
			-- 	callback = function()
			-- 		if vim.fn.pumvisible() == 1 or vim.fn.state("m") == "m" then
			-- 			return
			-- 		end
			-- 		local char = vim.v.char
			-- 		if vim.list_contains(triggers, char) then
			-- 			local key = vim.keycode("<C-x><C-n>")
			-- 			vim.api.nvim_feedkeys(key, "m", false)
			-- 		end
			-- 	end,
			-- })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"cmake",
					"cssls",
					"css_variables",
					"cssmodules_ls",
					"eslint",
					"html",
					"lua_ls",
					"phpactor",
					"ts_ls",
					"vue_ls",
				},
			})
		end,
	},
}
