-- ~/.config/nvim/lua/plugins/which-key.lua
return {
    {
        "folke/which-key.nvim",
        dependencies = { "echasnovski/mini.nvim", version = false },
        event = "VeryLazy",
        opts = {
            plugins = {
                marks = true,
                registers = true,
                spelling = { enabled = true, suggestions = 20 },
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true
                },
            },
            icons = {
                breadcrumb = "»",
                separator = "➜",
                group = "+",
                colors = true,
                rules = {
                    { pattern = "<leader>w", icon = "💾", color = "blue" },
                    { pattern = "<leader>q", icon = "🚪", color = "red" },
                    { pattern = "<leader>e", icon = "🔄", color = "green" },
                    { pattern = "<leader>h", icon = "🧹", color = "yellow" },
                    { pattern = "<leader>y", icon = "📋", color = "cyan" },
                    { pattern = "<leader>b", icon = "📑", color = "purple" },
                    { pattern = "<leader>bd", icon = "🗑️", color = "red" },
                    { pattern = "<leader>n", icon = "➡️", color = "green" },
                    { pattern = "<leader>p", icon = "⬅️", color = "green" },
                    { pattern = "<leader>s", icon = "🪟", color = "orange" },
                    { pattern = "<leader>sv", icon = "│", color = "orange" },
                    { pattern = "<leader>sh", icon = "─", color = "orange" },
                    { pattern = "<C-h>", icon = "⬅️", color = "blue" },
                    { pattern = "<C-j>", icon = "⬇️", color = "blue" },
                    { pattern = "<C-k>", icon = "⬆️", color = "blue" },
                    { pattern = "<C-l>", icon = "➡️", color = "blue" },
                    { pattern = "<leader>m", icon = "↕️", color = "yellow" },
                    { pattern = "<leader>mj", icon = "↓", color = "yellow" },
                    { pattern = "<leader>mk", icon = "↑", color = "yellow" },
                    { pattern = "n", icon = "🔍", color = "cyan" },
                    { pattern = "N", icon = "🔍", color = "cyan" },
                    { pattern = "<leader>r", icon = "✏️", color = "purple" },
                    { pattern = "<leader>rn", icon = "✏️", color = "purple" },
                    { pattern = "<leader>c", icon = "🔧", color = "green" },
                    { pattern = "<leader>ca", icon = "🔧", color = "green" },
                    { pattern = "<leader>F", icon = "🖌️", color = "blue" },
                    { pattern = "gd", icon = "📍", color = "orange" },
                    { pattern = "K", icon = "ℹ️", color = "cyan" },
                    { pattern = "%[d", icon = "⬅️", color = "red" },
                    { pattern = "%]d", icon = "➡️", color = "red" },
                    { pattern = "p", icon = "📋", color = "cyan" },
                    { pattern = "<leader>f", icon = "🔭", color = "cyan" },
                    { pattern = "<leader>ff", icon = "📄", color = "cyan" },
                    { pattern = "<leader>fg", icon = "🔍", color = "cyan" },
                    { pattern = "<leader>fb", icon = "📑", color = "cyan" },
                    { pattern = "<leader>fh", icon = "❓", color = "cyan" },
                    -- { pattern = "<leader>fe", icon = "📄", color = "cyan" },
                    { pattern = "<leader>g", icon = "", color = "green" },
                    { pattern = "<leader>gt", icon = "", color = "green" },
                    -- { pattern = "<leader>u", icon = "↩️", color = "purple" }, -- Undo
                    { pattern = ".*", icon = "⚙️", color = "gray" },
                },
            },
            win = {
                border = "rounded",
                padding = { 1, 2, 1, 2 },
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 3,
                align = "left",
            },
            show_help = true,
            --triggers = {
            --"auto",
            --},
        },
        config = function(_, opts)
            require("mini.icons").setup()
            local wk = require("which-key")
            wk.setup(opts)

            -- Register keymaps
            wk.add({
                { "<leader>?",  function() wk.show({ global = false }) end, desc = "Buffer Local Keymaps" },


                { "<leader>w",  desc = "Save file" },
                { "<leader>q",  desc = "Quit" },
                { "<leader>e",  desc = "Reload file" },

                { "<leader>h",  desc = "Clear search highlights" },

                { "<leader>y",  desc = "Yank to clipboard",                 mode = { "n", "v" } },

                { "<leader>b",  group = "Buffer" },
                { "<leader>bd", desc = "Close buffer" },
                { "<leader>n",  desc = "Next Buffer" },
                { "<leader>p",  desc = "Previous Buffer" },

                { "<leader>s",  group = "Split" },
                { "<leader>sv", desc = "Vertical split" },
                { "<leader>sh", desc = "Horizontal split" },

                { "<C-h>",      desc = "Left Window" },
                { "<C-j>",      desc = "Below Window" },
                { "<C-k>",      desc = "Above Window" },
                { "<C-l>",      desc = "Right Window" },

                { "<leader>m",  group = "Move lines" },
                { "<leader>mj", desc = "Move line down",                    mode = "n" },
                { "<leader>mk", desc = "Move line up",                      mode = "n" },
                { "<leader>mj", desc = "Move selected lines down",          mode = "v" },
                { "<leader>mk", desc = "Move selected lines up",            mode = "v" },

                { "n",          desc = "Next search, centered" },
                { "N",          desc = "Previous search, centered" },

                { "<leader>r",  group = "Rename" },
                { "<leader>rn", desc = "Rename (LSP)" },

                { "<leader>c",  group = "Code" },
                { "<leader>ca", desc = "Code action (LSP)" },
                { "<leader>F",  desc = "Format Document (LSP)" },
                { "gd",         desc = "Go to definition (LSP)" },
                { "K",          desc = "Hover (LSP)" },

                { "[d",         desc = "Previous diagnostic (LSP)" },
                { "]d",         desc = "Next diagnostic (LSP)" },

                { "<leader>f",  group = "Find (Telescope)" },
                { "<leader>ff", desc = "Find files" },
                -- { "<leader>fe", desc = "File explorer" },
                { "<leader>fg", desc = "Live grep" },
                { "<leader>fb", desc = "Buffers" },
                { "<leader>fh", desc = "Help tags" },
                -- { "<leader>fu", desc = "Undo Tree" },

                { "<leader>g",  group = "Git" },
                { "<leader>gt", desc = "Git status (diff)" },


            }, { mode = "n", unless = { "v" } })
            wk.add({
                { "p", desc = "Paste without yanking", mode = "v" },
            }, { mode = "v" })
        end,
    },
}
