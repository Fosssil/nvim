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

	vim.keymap.set("n", "n", search("n"), {
		desc = "Next Search Result",
	})

	vim.keymap.set("n", "N", search("N"), {
		desc = "Previous Search Result",
	})

	vim.keymap.set("n", "*", function()
		vim.cmd.normal({ "*", bang = true })
		hlslens.start()
	end, {
		desc = "Search Word Forward",
	})

	vim.keymap.set("n", "#", function()
		vim.cmd.normal({ "#", bang = true })
		hlslens.start()
	end, {
		desc = "Search Word Backward",
	})

	vim.keymap.set("n", "g*", function()
		vim.cmd.normal({ "g*", bang = true })
		hlslens.start()
	end, {
		desc = "Partial Search Forward",
	})

	vim.keymap.set("n", "g#", function()
		vim.cmd.normal({ "g#", bang = true })
		hlslens.start()
	end, {
		desc = "Partial Search Backward",
	})

	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
		desc = "Clear Search Highlight",
	})
end
