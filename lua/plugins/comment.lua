-- ~/.config/nvim/lua/plugins/comment.lua
return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            local comment = require("Comment")

            comment.setup({
                -- Optional settings (default is good, but we can expand!)
                padding = true,
                sticky = true,
                ignore = nil,
                mappings = {
                    basic = true,
                    extra = true,
                },
            })

            -- Normal mode toggle comment with <leader>/
            vim.keymap.set("n", "<leader>/", function()
                require("Comment.api").toggle.linewise.current()
            end, { desc = "Toggle comment" })

            -- Visual mode toggle comment with <leader>/
            vim.keymap.set("x", "<leader>/", function()
                require("Comment.api").toggle.linewise(vim.fn.visualmode())
            end, { desc = "Toggle comment" })

            -- Optional: Add mapping to block comments too (C-style /* */)
            vim.keymap.set("n", "<leader>?", function()
                require("Comment.api").toggle.blockwise.current()
            end, { desc = "Toggle block comment" })

            vim.keymap.set("x", "<leader>?", function()
                require("Comment.api").toggle.blockwise(vim.fn.visualmode())
            end, { desc = "Toggle block comment" })

            -- -- Optional: Use which-key integration if you want cleaner hints!
            -- local has_wk, wk = pcall(require, "which-key")
            -- if has_wk then
            --     wk.register({
            --         { "<leader>/", desc "Toggle line comment" },
            --         { "<leader>?", desc "Toggle block comment" },
            --     })
            -- end
        end,
    },
}
