return {
    "debugloop/telescope-undo.nvim",

    dependencies = {
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
        },
    },

    keys = {
        {
            "<leader>u",
            "<cmd>Telescope undo<CR>",
            desc = "Undo History",
        },
    },

    opts = {
        extensions = {
            undo = {
                use_delta = true,
                side_by_side = true,

                layout_strategy = "vertical",
                layout_config = {
                    preview_height = 0.8,
                },

                -- Keep plugin defaults for everything else
                vim_diff_opts = {
                    ctxlen = vim.o.scrolloff,
                },

                entry_format = "state #$ID, $STAT, $TIME",
                time_format = "",
                saved_only = false,
            },
        },
    },

    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("undo")
    end,
}
