return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			local ts = require("nvim-treesitter")

			-- Initialize nvim-treesitter
			ts.setup({
				textobjects = {
					select = {
						lookahead = true,

						include_surrounding_whitespace = false,

						selection_modes = {
							["@function.outer"] = "V",
							["@class.outer"] = "V",
						},
					},

					move = {
						set_jumps = true,
					},
				},
			})

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
