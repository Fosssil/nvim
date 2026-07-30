return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},

		config = function()
			local ts = require("nvim-treesitter")

			-- Initialize nvim-treesitter
			ts.setup({})

			-- Enable Treesitter for every supported buffer
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterAutoStart", { clear = true }),

				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			-- Treesitter Context
			require("treesitter-context").setup({
				enable = true,
				max_lines = 3,
				trim_scope = "outer",
				mode = "cursor",
				separator = "─",
				zindex = 20,
			})
		end,
	},
}
