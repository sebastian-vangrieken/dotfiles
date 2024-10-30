local M = {
    "echasnovski/mini.pairs",
    version = "*",
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
}

return M
