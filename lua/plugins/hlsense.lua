-- ~/.config/nvim/lua/plugins/hlsense.lua


return {
	"kevinhwang91/nvim-hlslens",

	event = "VeryLazy",

	opts = {
		auto_enable = true,

		enable_incsearch = true,

		-- Keep the lens information visible unless the search
		-- context is actually invalidated.
		calm_down = false,

		-- Show information for all matches.
		nearest_only = false,

		nearest_float_when = "auto",

		-- Subtle floating window blending.
		float_shadow_blend = 20,

		-- Keep hlslens visible above other virtual text.
		virt_priority = 200,

		------------------------------------------------------------------
		-- Nocturne-style compact search indicator
		------------------------------------------------------------------

		override_lens = function(render, posList, nearest, idx, relIdx)
			local lnum, col = unpack(posList[idx])
			local total = #posList

			local text = ("%d/%d"):format(idx, total)

			local chunks

			if nearest then
				chunks = {
					{ "  " },
					{ text, "HlSearchLensNear" },
				}
			else
				chunks = {
					{ "  " },
					{ text, "HlSearchLens" },
				}
			end

			render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
		end,
	},

	config = function(_, opts)
		require("hlslens").setup(opts)

		local hlslens = require("hlslens")

		------------------------------------------------------------------
		-- Normal search navigation
		------------------------------------------------------------------

		local function search(key)
			return function()
				-- Prevent an unsuccessful search from throwing
				-- an ugly command-line error.
				pcall(vim.cmd.normal, {
					key,
					bang = true,
				})

				hlslens.start()
			end
		end

		vim.keymap.set("n", "n", search("n"), {
			desc = "Next Search Result",
		})

		vim.keymap.set("n", "N", search("N"), {
			desc = "Previous Search Result",
		})

		------------------------------------------------------------------
		-- Search from beginning of buffer
		------------------------------------------------------------------

		local function search_from_top(key)
			return function()
				-- Move to the beginning of the buffer.
				vim.cmd("normal! gg")

				-- Search from there.
				pcall(vim.cmd.normal, {
					key,
					bang = true,
				})

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
			desc = "Search Partial Word Forward",
		})

		vim.keymap.set("n", "g#", search_from_top("g#"), {
			desc = "Search Partial Word Backward",
		})

		------------------------------------------------------------------
		-- Clear search
		------------------------------------------------------------------

		vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
			desc = "Clear Search Highlight",
		})
	end,
}
