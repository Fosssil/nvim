-- ~/.config/nvim/lua/plugins/hlsense.lua
return {
	"kevinhwang91/nvim-hlslens",

	event = "VeryLazy",

	opts = {
		auto_enable = true,

		enable_incsearch = true,

		calm_down = true,

		nearest_only = false,

		nearest_float_when = "auto",

		float_shadow_blend = 20,

		virt_priority = 200,
	},

	config = function(_, opts)
		require("hlslens").setup(opts)

		local hlslens = require("hlslens")

		local function search(key)
			return function()
				vim.cmd.normal({ key, bang = true })
				hlslens.start()
			end
		end

		vim.keymap.set("n", "n", search("n"), { desc = "Next Search Result" })
		vim.keymap.set("n", "N", search("N"), { desc = "Previous Search Result" })

		vim.keymap.set("n", "*", function()
			vim.cmd.normal({ "*", bang = true })
			hlslens.start()
		end, { desc = "Search Word Forward" })

		vim.keymap.set("n", "#", function()
			vim.cmd.normal({ "#", bang = true })
			hlslens.start()
		end, { desc = "Search Word Backward" })

		vim.keymap.set("n", "g*", function()
			vim.cmd.normal({ "g*", bang = true })
			hlslens.start()
		end, { desc = "Partial Search Forward" })

		vim.keymap.set("n", "g#", function()
			vim.cmd.normal({ "g#", bang = true })
			hlslens.start()
		end, { desc = "Partial Search Backward" })

		vim.keymap.set("n", "<Esc>", function()
			vim.cmd("nohlsearch")
		end, { desc = "Clear Search Highlight" })
	end,
}
