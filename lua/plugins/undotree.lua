-- ~/.config/nvim/lua/plugins/undotree.lua
return {
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "[U]ndotree Toggle" },
        },
        config = function()
            vim.g.undotree_WindowLayout = 2       -- Split side by side
            vim.g.undotree_ShortIndicators = 1    -- Shorter indicators in tree
            vim.g.undotree_SetFocusWhenToggle = 1 -- Focus the window when opened

            -- Custom highlight to match Catppuccin
            vim.cmd([[
                    highlight UndotreeNodeName guifg=#cba6f7
                    highlight UndotreeNodeCurrent guifg=#f38ba8 gui=bold
                    highlight UndotreeNodeVisited guifg=#f9e2af
                    highlight UndotreeTimestamp guifg=#a6e3a1
                    highlight UndotreeSavedBig guifg=#fab387 gui=bold
                    highlight UndotreeSavedSmall guifg=#94e2d5
                ]])
        end,
    },
}
