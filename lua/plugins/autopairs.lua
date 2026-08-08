-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" }, -- No pairs in Telescope or Vimscript
				check_ts = true, -- enable treesitter integration for smarter pairing
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "^4.*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
