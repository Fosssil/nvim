-- ~/.config/nvim/lua/keymaps/format.lua

local map = vim.keymap.set

map({ "n", "x" }, "<leader>fd", function()
	local conform = require("conform")
	local bufnr = vim.api.nvim_get_current_buf()

	local before = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)

	conform.format({
		bufnr = bufnr,
		async = true,
		lsp_format = "fallback",
	}, function(err)
		if err then
			vim.notify("Formatting failed: " .. err, vim.log.levels.ERROR)
			return
		end

		vim.schedule(function()
			local after = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)

			if vim.deep_equal(before, after) then
				vim.notify("Nothing to format", vim.log.levels.INFO)
			else
				vim.notify("Formatted", vim.log.levels.INFO)
			end
		end)
	end)
end, {
	desc = "Format Buffer",
})
