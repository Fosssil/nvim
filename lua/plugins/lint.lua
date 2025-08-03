-- ~/.config/nvim/lua/plugins/lint.lua
return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local lint = require("lint")

			-- Setup linters by filetype
			lint.linters_by_ft = {
				lua = { "luacheck" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
				html = { "htmlhint" },
				css = { "stylelint" },
				json = { "jsonlint" },
			}

			-- Global diagnostic config
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = false,
				update_in_insert = false,
				severity_sort = true,
				--				float = {
				--					border = "rounded",
				--				},
			})

			-- Faster CursorHold
			vim.o.updatetime = 250

			-- Float window on CursorHold
			--			vim.api.nvim_create_autocmd("CursorHold", {
			--				callback = function()
			--					vim.diagnostic.open_float(nil, { focus = false })
			--				end,
			--			})

			-- Clear diagnostics before linting to avoid duplicates
			local function clear_and_lint()
				vim.diagnostic.reset(nil, 0) -- Clear diagnostics for current buffer
				lint.try_lint()
			end

			-- Trigger linting on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = vim.api.nvim_create_augroup("Linting", { clear = true }),
				callback = clear_and_lint,
			})

			-- Manual lint command
			vim.api.nvim_create_user_command("Lint", function()
				lint.try_lint()
			end, { desc = "Lint current buffer" })
		end,
	},
}
