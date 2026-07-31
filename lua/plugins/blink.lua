-- ~/.config/nvim/lua/plugins/blink.lua
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
			opts = {
				use_label_description = true,
			},
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

				lsp = {
					name = "LSP",
					fallbacks = { "buffer" },
					score_offset = 100,
				},

				buffer = {
					name = "Buf",
					score_offset = 20,
				},

				path = {
					name = "Path",
					score_offset = -5,
				},

				snippets = {
					name = "Snip",
					score_offset = -10,
				},
			},
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
			},

			ghost_text = {
				enabled = true,

				show_with_selection = true,
				show_without_selection = false,

				show_with_menu = true,
				show_without_menu = false,
			},

			menu = {

				direction_priority = function()
					local blink = require("blink.cmp")

					local ctx = blink.get_context()
					local item = blink.get_selected_item()

					if not ctx or not item then
						return { "s", "n" }
					end

					local text = item.textEdit and item.textEdit.newText or item.insertText or item.label

					if text:find("\n") then
						vim.g.blink_cmp_upwards_ctx_id = ctx.id
						return { "n", "s" }
					end

					if vim.g.blink_cmp_upwards_ctx_id == ctx.id then
						return { "n", "s" }
					end

					return { "s", "n" }
				end,

				min_width = 35,
				max_height = 10,
				scrolloff = 2,
				scrollbar = true,

				draw = {
					components = {
						label = {
							width = {
								fill = true,
								max = 45,
							},
						},

						kind = {
							width = {
								min = 10,
								max = 12,
							},
						},

						kind_icon = {
							ellipsis = false,

							text = function(ctx)
								return " " .. ctx.kind_icon .. "  "
							end,

							highlight = function(ctx)
								return {
									{
										group = ctx.kind_hl,
										priority = 20000,
									},
								}
							end,
						},
					},

					align_to = "label",
					padding = { 2, 2 },
					gap = 3,

					columns = {
						{ "kind_icon" },
						{
							"label",
							"label_description",
							gap = 2,
						},
						{
							"kind",
						},
						{
							"source_name",
						},
					},
				},
			},
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				"score",
				"sort_text",
				"label",
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
