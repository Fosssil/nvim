-- ~/.config/nvim/lua/plugins/comment.lua
return {
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			local comment = require("Comment")

			comment.setup({
				padding = true, -- Add padding to comments (e.g., ` -- comment` instead of `--comment`)
				sticky = true, -- Keep cursor in place after commenting
				ignore = "^$", -- Ignore empty lines when commenting
				mappings = {
					basic = true, -- Enable basic mappings (e.g., `gcc` for line comment)
					extra = true, -- Enable extra mappings (e.g., `gco` for comment below)
				},
				toggler = {
					line = "gcc", -- Default line-wise toggle (can override with custom)
					block = "gbc", -- Default block-wise toggle
				},
				opleader = {
					line = "gc", -- Operator-pending line-wise (e.g., `gc` in visual mode)
					block = "gb", -- Operator-pending block-wise
				},
			})

			-- Normal mode: Toggle line-wise comment with <leader>/
			vim.keymap.set("n", "<leader>/", function()
				require("Comment.api").toggle.linewise.current()
			end, { desc = "Toggle line comment" })

			-- Visual mode: Toggle line-wise comment with <leader>/
			vim.keymap.set("x", "<leader>/", function()
				-- Escape visual mode and operate on the selected range
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "nx", false)
				require("Comment.api").toggle.linewise(vim.fn.visualmode())
			end, { desc = "Toggle line comment" })

			-- Normal mode: Toggle block-wise comment with <leader>?
			vim.keymap.set("n", "<leader>?", function()
				require("Comment.api").toggle.blockwise.current()
			end, { desc = "Toggle block comment" })

			-- Visual mode: Toggle block-wise comment with <leader>?
			vim.keymap.set("x", "<leader>?", function()
				-- Escape visual mode and operate on the selected range
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "nx", false)
				require("Comment.api").toggle.blockwise(vim.fn.visualmode())
			end, { desc = "Toggle block comment" })

			-- Optional: Debugging to diagnose range issues
			-- Uncomment to print the visual mode range when commenting
			-- vim.keymap.set("x", "<leader>/", function()
			--     local start_line = vim.fn.line("'<")
			--     local end_line = vim.fn.line("'>")
			--     print("Commenting lines: " .. start_line .. " to " .. end_line)
			--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "nx", false)
			--     require("Comment.api").toggle.linewise(vim.fn.visualmode())
			-- end, { desc = "Toggle line comment (debug)" })
		end,
	},
}
