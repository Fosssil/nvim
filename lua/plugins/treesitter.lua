-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash", "c", "css", "html", "lua", "json", "jsonc",
                    "markdown", "python", "rasi", "terraform", "toml",
                    "vim", "vimdoc", "yaml",
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>s",    -- Start selection
                        node_incremental = "<leader>s",  -- Expand node
                        scope_incremental = "<leader>s", -- Expand scope
                        node_decremental = "<leader>s",  -- Shrink selection
                    },
                },
                indent = { enable = true },
                rainbow = {
                    enable = false,
                    extended_mode = true,
                    max_file_lines = nil,
                    colors = {
                        "#f5e0dc", -- Rosewater
                        "#f2cdcd", -- Flamingo
                        "#f5c2e7", -- Pink
                        "#cba6f7", -- Mauve
                        "#f38ba8", -- Red
                        "#fab387", -- Peach
                        "#f9e2af", -- Yellow
                    },
                },
            })

            -- Treesitter Context setup (outside of setup table)
            require("treesitter-context").setup({
                enable = true,        -- Enable this plugin
                max_lines = 5,        -- Show context for up to 5 lines
                trim_scope = "outer", -- Which context lines to discard
                mode = "cursor",      -- Show context at cursor position
                separator = "-",      -- No separator line
                zindex = 20,          -- Display priority
                on_attach = nil,      -- Function to attach to specific buffers
            })
        end,
    },
}
