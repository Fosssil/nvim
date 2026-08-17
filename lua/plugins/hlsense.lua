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
				vim.cmd("normal! zz")
				hlslens.start()
			end
		end

		-- Navigate search results
		vim.keymap.set("n", "n", search("n"), {
			desc = "Next Search Result",
		})

		vim.keymap.set("n", "N", search("N"), {
			desc = "Previous Search Result",
		})

		-- Start searches from the top of the buffer
		local function search_from_top(key)
			return function()
				local view = vim.fn.winsaveview()

				vim.cmd("normal! gg")
				vim.cmd.normal({ key, bang = true })

				vim.fn.winrestview(view)
				hlslens.start()
			end
		end

		vim.keymap.set("n", "*", search_from_top("*"), {
			desc = "Search Word Forward",
		})

		vim.keymap.set("n", "#", search_from_top("#"), {
			desc = "Search Word Backward",
		})

		vim.keymap.set("n", "g*", search_from_top("g*"), {
			desc = "Partial Search Forward",
		})

		vim.keymap.set("n", "g#", search_from_top("g#"), {
			desc = "Partial Search Backward",
		})

		vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
			desc = "Clear Search Highlight",
		})
	end,
}
