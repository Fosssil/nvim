return {
	"saghen/blink.cmp",

	version = "1.*",

	-- build = "cargo build --release",

	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	opts = {
		keymap = {
			-- We'll design this ourselves
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
		},

		snippets = {
			preset = "default",
		},

		sources = {
			default = {
				"lsp",
				"buffer",
				"snippets",
				"path",
			},

			providers = {
				cmdline = {
					min_keyword_length = function(ctx)
						if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
							return 3
						end

						return 0
					end,
				},
			},
		},

		completion = {
			documentation = {
				auto_show = false,
			},

			ghost_text = {
				enabled = true,
			},

			menu = {
				max_height = 12,
			},
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
		},

		cmdline = {
			keymap = {
				preset = "inherit",
			},

			completion = {
				menu = {
					auto_show = function()
						return vim.fn.getcmdtype() == ":"
					end,
				},
			},
		},
	},
}
