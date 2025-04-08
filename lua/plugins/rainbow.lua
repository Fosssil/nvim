return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Ensure Tree-sitter is loaded
        event = { "BufReadPost", "BufNewFile" },              -- Load when opening files
        config = function()
            -- Optional configuration (see Step 2)
            require("rainbow-delimiters.setup").setup {
                strategy = {
                    [""] = "rainbow-delimiters.strategy.global", -- Default strategy for all filetypes
                    vim = "rainbow-delimiters.strategy.local",   -- Use local strategy for HTML
                },
                query = {
                    [""] = "rainbow-delimiters", -- Default query
                    lua = "rainbow-blocks",      -- Use blocks for Lua
                },
                highlight = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            }
        end,
    },
}
