return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" }, -- No pairs in Telescope or Vimscript
                check_ts = true,                                 -- enable treesitter integration for smarter pairing
                ts_config = {
                    lua = { "string" },                          -- Skip pairing in Lua strings
                    python = { "string" },                       -- Skip in Python strings
                    markdown = { "comment" },                    -- Skip in Markdown comments
                },
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            { "hrsh7th/nvim-cmp", optional = true },
        },
    },

    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup({
                filetypes = { "html", "javascript", "typescript", "markdown", "xml" },
            })
        end,
    }
}
