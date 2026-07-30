-- ~/.config/nvim/lua/plugins/catppuccin.lua
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},

		transparent_background = false,
		float = {
			transparent = false,
			solid = false,
		},

		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		-- Text Styles

		no_italic = true,
		no_bold = false,
		no_underline = false,

		styles = {
			comments = {},
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},

		-- LSP

		lsp_styles = {
			virtual_text = {
				errors = {},
				warnings = {},
				hints = {},
				information = {},
				ok = {},
			},

			underlines = {
				errors = { "underline" },
				warnings = { "underline" },
				hints = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},

			inlay_hints = {
				background = true,
			},
		},

		-- Nocturne Palette

		color_overrides = {
			mocha = {
				-- Background

				base = "#1A1B26",
				mantle = "#16161E",
				crust = "#13131A",

				-- Accents

				blue = "#8DB8FF",
				teal = "#90D9E8",
				sky = "#90D9E8",
				yellow = "#D8C47A",
			},
		},

		-- Highlight Overrides

		custom_highlights = function(colors)
			return {
				BlinkCmpMenu = {
					bg = colors.surface0,
				},

				BlinkCmpMenuBorder = {
					bg = colors.surface0,
					fg = colors.overlay1,
				},

				BlinkCmpMenuSelection = {
					bg = colors.surface1,
					bold = true,
				},

				BlinkCmpDoc = {
					bg = colors.surface1,
				},

				BlinkCmpDocBorder = {
					bg = colors.surface1,
					fg = colors.overlay1,
				},

				LineNr = {
					fg = colors.subtext0,
				},

				CursorLineNr = {
					-- fg = colors.mauve,
					fg = "#D6B8FA",
					bold = true,
				},
			}
		end,

		-- Plugin Integrations

		auto_integrations = true,
		integrations = {

			blink_cmp = {
				style = "bordered",
			},

			lualine = {
				all = function(colors)
					return {
						normal = {
							a = {
								bg = colors.mauve,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.mauve,
							},
						},

						insert = {
							a = {
								bg = colors.green,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.green,
							},
						},
						visual = {
							a = {
								bg = colors.yellow,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.yellow,
							},
						},

						replace = {
							a = {
								bg = colors.red,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.red,
							},
						},

						command = {
							a = {
								bg = colors.peach,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.peach,
							},
						},

						terminal = {
							a = {
								bg = colors.green,
								fg = colors.base,
								gui = "bold",
							},
							b = {
								fg = colors.green,
							},
						},
					}
				end,
			},

			gitsigns = {
				enabled = true,
				transparent = false,
			},

			telescope = {
				enabled = true,
			},

			treesitter = true,
			treesitter_context = true,

			mason = true,

			neotree = true,

			render_markdown = true,

			rainbow_delimiters = true,

			snacks = {
				enabled = true,
				indent_scope_color = "",
			},

			mini = {
				enabled = true,
				indentscope_color = "",
			},

			which_key = true,

			notify = true,

			noice = true,

			lsp_trouble = true,

			dap = true,
			dap_ui = true,

			navic = {
				enabled = true,
				custom_bg = "NONE",
			},

			illuminate = {
				enabled = true,
				lsp = true,
			},

			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = {},
					warnings = {},
					hints = {},
					information = {},
				},

				underlines = {
					errors = { "underline" },
					warnings = { "underline" },
					hints = { "underline" },
					information = { "underline" },
				},
			},
		},
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
