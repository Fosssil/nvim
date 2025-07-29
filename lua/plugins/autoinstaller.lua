return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- LSP servers
				"bashls",
				"cssls",
				"html",
				"lua_ls",
				"jsonls",
				"hyprls",
				"gopls",

				-- Formatters
				"stylua",
				"prettier",
				"shfmt",
				"gofumpt",

				-- Linters
				"luacheck",
				"shellcheck",
				"stylelint",
				"jsonlint",
				"htmlhint",
				"golangci-lint",
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 3000, -- Delay (ms) to reduce startup load
			integrations = {
				["mason-lspconfig"] = true,
			},
		})
	end,
}
