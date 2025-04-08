-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    {
        "catppuccin/nvim",
        name = "catppuccin", -- Ensures the plugin is named correctly
        lazy = false,
        priority = 1000,     -- Load early to set colorscheme before other UI plugins
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- Options: "latte", "frappe", "macchiato", "mocha"
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    dim_inactive = { enabled = false },
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                },
                transparent_background = false,
                disable_background = true,
                show_end_of_buffer = true,
                term_colors = true,
                styles = {
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                },
            })
            vim.cmd("colorscheme catppuccin")
        end,
    },

    {
        "folke/tokyonight.nvim", -- Colorscheme plugin
        lazy = true,             -- Load immediately
        priority = 999,          -- Ensure it loads first
        config = function()
            require("tokyonight").setup({
                style = "night",        -- Available: "storm", "moon", "night", "day"
                transparent = false,    -- Disable background color
                terminal_colors = true, -- Use colors in terminal
                sidebars = { "terminal", "qf" },
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = { bold = true },
                    variables = { bold = true },
                },
            })
            -- vim.cmd([[colorscheme tokyonight]])
        end,
    }
}
