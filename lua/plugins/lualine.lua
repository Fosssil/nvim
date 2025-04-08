return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "lewis6991/gitsigns.nvim",
        "catppuccin/nvim",
    },
    config = function()
        local colors = require("catppuccin.palettes").get_palette("mocha")
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                globalstatus = true,
                icons_enabled = true,
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    { "mode", icon = "" }
                },
                lualine_b = {
                    {
                        "filename",
                        symbols = {
                            modified = " [Modified]",
                            readonly = " 🔒",
                            unnamed = "[No Name]",
                            newfile = "[New]"
                        }
                    },
                },
                lualine_c = {
                    {
                        "branch",
                        icon = "",
                        color = {
                            fg = colors.yellow
                        }
                    },
                    {
                        "diff",
                        symbols = { added = "➕ ", modified = "🟡 ", removed = "🔴 " },
                        colored = true,
                        cond = function()
                            return vim.b.gitsigns_head ~= nil
                        end,
                        color = {
                            added = { fg = colors.green },
                            modified = { fg = colors.yellow },
                            removed = { fg = colors.red },
                        },
                    },
                    {
                        "diagnostics",
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        sources = { "nvim_diagnostic" },
                        update_in_insert = false,
                        color = {
                            error = { fg = colors.red },
                            warn = { fg = colors.yellow },
                            info = { fg = colors.blue },
                            hint = { fg = colors.teal },
                        },
                    },
                },

                lualine_x = {
                    function() return vim.lsp.get_clients({ bufnr = 0 })[1] and "LSP" or "" end,
                    "encoding",
                    "fileformat",
                    { "filetype", icon_only = false }
                },
                lualine_y = { "progress" },
                lualine_z = {
                    "location",
                },
            },

            extensions = { "nvim-tree", "fugitive", "toggleterm" },
        })
    end,
}
