-- ~/.config/nvim/lua/plugins/indent-blankline.lua
return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = {
				char = "┊", -- You can change this to "┊" or "¦" or "⎸" for personal preference
				highlight = {
					"RainbowRed",
					"RainbowYellow",
					"RainbowBlue",
					"RainbowOrange",
					"RainbowGreen",
					"RainbowViolet",
					"RainbowCyan",
				},
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = false,
				highlight = {
					"Function",
					"Label",
				},
			},
			whitespace = {
				remove_blankline_trail = true,
			},
			exclude = {
				filetypes = {
					"help",
					"terminal",
					"dashboard",
					"lazy",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
				},
				buftypes = { "terminal", "nofile" },
			},
		},
		config = function(_, opts)
			local ibl = require("ibl")
			local hooks = require("ibl.hooks")

			-- 🌈 Define rainbow colors
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			-- 🔥 Set highlight groups
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" }) -- soft red
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" }) -- pastel yellow
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" }) -- sky blue
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" }) -- mellow orange
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" }) -- muted green
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba6f7" }) -- lavender
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#94e2d5" }) -- aqua mint
			end)

			-- 🚀 Apply setup
			ibl.setup(opts)
		end,
	},
}
