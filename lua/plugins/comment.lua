-- ~/.config/nvim/lua/plugins/comment.lua
return {
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",

		opts = {
			-- Add a space after the comment delimiter.
			padding = true,

			-- Keep cursor position after commenting.
			sticky = true,

			-- Ignore empty lines.
			ignore = "^$",

			mappings = {
				basic = true,
				extra = true,
			},

			toggler = {
				line = "gcc",
				block = "gbc",
			},

			opleader = {
				line = "gc",
				block = "gb",
			},

			-- Future:
			-- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		},

		config = function(_, opts)
			require("Comment").setup(opts)

			vim.keymap.set("n", "<leader>/", "gcc", {
				remap = true,
				desc = "Toggle line comment",
			})

			vim.keymap.set("n", "<leader>?", "gbc", {
				remap = true,
				desc = "Toggle block comment",
			})

			vim.keymap.set("x", "<leader>/", "gc", {
				remap = true,
				desc = "Toggle line comment",
			})

			vim.keymap.set("x", "<leader>?", "gb", {
				remap = true,
				desc = "Toggle block comment",
			})
		end,
	},
}
