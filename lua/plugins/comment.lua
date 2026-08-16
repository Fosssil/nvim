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
				basic = false,
				extra = false,
			},

			-- Future:
			-- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		},
	},
}
