-- ~/.config/nvim/lua/plugins/which-key.lua

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			delay = 300,
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
				rules = false,
			},

			triggers = {
				{ "<auto>", mode = "nixsotc" },
				{ "s", mode = "n" },
			},

			win = {
				border = "rounded",
				padding = { 1, 2 },
			},

			layout = {
				height = {
					min = 4,
					max = 25,
				},

				width = {
					min = 20,
					max = 50,
				},
			},
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},
			show_help = true,
			show_keys = true,
			disable = {
				buftypes = {},
				filetypes = {
					"telescopeprompt",
					"lazy",
					"mason",
				},
			},

			spec = {
				{
					"<leader>b",
					group = "buffers",
				},
				{
					"<leader>c",
					group = "comments",
				},
				{
					"<leader>f",
					desc = "find / format",
				},
				{
					"<leader>m",
					group = "multicursor",
				},
			},
		},
	},
}
