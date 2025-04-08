-- ~/.config/nvim/lua/plugins/format.lua
return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    sh = { "shfmt" },
                    bash = { "shfmt" },
                    html = { "prettier" },
                    css = { "prettier" },
                    json = { "prettier" },
                    markdown = { "prettier" },
                },
                format_on_save = function(bufnr)
                    if vim.g.disable_autoformat then
                        return
                    end
                    return { timeout_ms = 500, lsp_fallback = true }
                end,
                formatters = {
                    shfmt = { command = "shfmt", args = { "-i", "2" } }, -- 2-space indent
                    prettier = { prepend_args = { "--single-quote", "--trailing-comma", "all" } },
                },

            })
            -- Optional: Manual formatting command
            vim.api.nvim_create_user_command("Format", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { desc = "Format current buffer" })
        end,
    },
}
