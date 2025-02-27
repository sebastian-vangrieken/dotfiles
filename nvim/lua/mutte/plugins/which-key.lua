return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
        triggers = {},
    },
    keys = {
        { 
            "<leader>?",
            function()
                require("which-key").show("") 
            end,
            desc = "Buffer Keymaps (which-key)",
        },
    },
}
