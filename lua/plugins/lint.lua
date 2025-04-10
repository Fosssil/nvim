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
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = { border = "rounded" },
			})

			-- Faster CursorHold
			vim.o.updatetime = 250

			-- Float window on CursorHold
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false })
				end,
			})

			-- Trigger linting on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					if not vim.g.disable_linting then
						lint.try_lint()
					end
				end,
			})

			-- Manual lint command
			vim.api.nvim_create_user_command("Lint", function()
				lint.try_lint()
			end, { desc = "Lint current buffer" })
		end,
	},
}
