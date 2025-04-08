-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",                -- Stable branch as of 2025
        dependencies = {
            { "nvim-lua/plenary.nvim" }, -- Required dependency
            { "echasnovski/mini.nvim" }, -- Already in your setup, for icons
            { "nvim-telescope/telescope-fzf-native.nvim",  build = "make", cond = vim.fn.executable("make") == 1 },
            { "nvim-telescope/telescope-file-browser.nvim" },
            -- { "debugloop/telescope-undo.nvim" },

        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")
            --   telescope.load_extension("undo")
            require("telescope").setup({
                defaults = {
                    -- Basic config, customize as needed
                    defaults = {
                        prompt_prefix = "🔍 ",
                        selection_caret = " ",
                        path_display = { "smart" },
                        layout_strategy = "horizontal",
                        layout_config = {
                            height = 0.9,
                            width = 0.9,
                        },
                        file_ignore_patterns = { "node_modules", "%.git/", "dist" },
                        sorting_strategy = "ascending",
                        winblend = 10,
                    },
                    pickers = {
                        find_files = { hidden = true },
                        live_grep = { additional_args = { "--hidden" } },
                        git_status = {
                            -- Optional: Customize git_status picker
                            previewer = require("telescope.previewers").git_file_diff.new({}),
                        },
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true,
                            override_generic_sorter = true,
                            override_file_sorter = true,
                            case_mode = "smart_case",
                        },
                        -- undo = {
                        --     -- Optional: Customize undo picker
                        --     side_by_side = true, -- Show diff side-by-side
                        --     layout_strategy = "vertical",
                        --     layout_config = { preview_height = 0.8 },
                        --     mappings = {
                        --         i = {
                        --             ["<CR>"] = function(prompt_bufnr)
                        --                 print("Attempting to restore undo state...")
                        --                 require("telescope-undo.actions").restore(prompt_bufnr)
                        --                 print("Restore action called")
                        --             end,
                        --             ["r"] = function(prompt_bufnr)
                        --                 print("Restoring with 'r' key...")
                        --                 require("telescope-undo.actions").restore(prompt_bufnr)
                        --             end,
                        --         },
                        --         n = {
                        --             ["<CR>"] = function(prompt_bufnr)
                        --                 print("Attempting to restore undo state...")
                        --                 require("telescope-undo.actions").restore(prompt_bufnr)
                        --                 print("Restore action called")
                        --             end,
                        --             ["r"] = function(prompt_bufnr)
                        --                 print("Restoring with 'r' key...")
                        --                 require("telescope-undo.actions").restore(prompt_bufnr)
                        --             end,
                        --         },
                        --     },
                        -- },

                        ["file_browser"] = {
                            hijack_netrw = true,
                            hidden = true,
                            respect_gitignore = false,
                            grouped = true,
                            initial_mode = "normal",
                        },
                    },

                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, -- Rounded borders
                },
            })
        end,
    },
}
