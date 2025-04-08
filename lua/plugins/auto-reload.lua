return {
    "nvim-lua/plenary.nvim",  -- Dependency (optional, but good practice!)
    lazy = true,
    config = function()
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = {
                vim.fn.stdpath("config") .. "/**/*.lua",
            },
            callback = function()
                local current_file = vim.fn.expand("%:p")
                vim.notify("Reloading Neovim config: " .. current_file, vim.log.levels.INFO, { title = "nvim-config" })
                -- Source the changed file
                vim.cmd("source " .. current_file)
                -- Restart LSP
                vim.cmd("LspRestart")
            end,
        })
    end,
}
