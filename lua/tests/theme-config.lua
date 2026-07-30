local theme = require("theme")

theme.setup({
	transparent = false,

	ui = {
		border = "rounded",
		opacity = 0.95,
		padding = 4,
		statusline = true,
		winbar = false,
	},

	typography = {
		italic_comments = true,
		bold_keywords = false,
	},

	syntax = {
		variables = "signature",
		properties = "accent",
		functions = "blue",
		types = "cyan",
		strings = "green",
		numbers = "warm",
	},

	integrations = {
		treesitter = true,
		blink = true,
		telescope = true,
		snacks = true,
		gitsigns = true,
		which_key = true,
		mini = true,
	},

	diagnostics = {
		virtual_text = "current_line",
		signs = true,
		underline = true,
		update_in_insert = false,
	},

	animations = {
		enabled = true,
		duration = 150,
		curve = "ease_out",
	},
})
