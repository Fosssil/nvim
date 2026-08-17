-- ~/.config/nvim/lua/core/keymaps.lua

local map = vim.keymap.set

-- Default options
local defaults = {
	noremap = true,
	silent = true,
}

-- Helper
local function key(mode, lhs, rhs, desc, extra)
	map(mode, lhs, rhs, vim.tbl_extend("force", defaults, { desc = desc }, extra or {}))
end

require("keymaps")

-- ──────────────────────────────────────────────────────────────────────────────────────────
-- Telescope
-- ──────────────────────────────────────────────────────────────────────────────────────────

key("n", "<leader>ff", "<cmd>Telescope find_files<CR>", "Find Files")
key("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", "File Browser")
key("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", "Live Grep")
key("n", "<leader>fb", "<cmd>Telescope buffers<CR>", "Buffers")
key("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", "Help Tags")
key("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", "Recent Files")

-- Git / Telescope
key("n", "<leader>gs", "<cmd>Telescope git_status<CR>", "Git Status")
key("n", "<leader>gh", "<cmd>Telescope git_file_history<CR>", "Git File History")

-- Undo
key("n", "<leader>u", "<cmd>Telescope undo<CR>", "Undo History")


-- ──────────────────────────────────────────────────────────────────────────────────────────
-- Treesitter Textobjects
-- ──────────────────────────────────────────────────────────────────────────────────────────

key({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject(
		"@function.outer",
		"textobjects"
	)
end, "Around Function")

key({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject(
		"@function.inner",
		"textobjects"
	)
end, "Inside Function")

key({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject(
		"@class.outer",
		"textobjects"
	)
end, "Around Class")

key({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject(
		"@class.inner",
		"textobjects"
	)
end, "Inside Class")

key({ "x", "o" }, "aa", function()
	require("nvim-treesitter-textobjects.select").select_textobject(
		"@parameter.outer",
		"textobjects"
	)
end, "Around Parameter")

key({ "x", "o" }, "ia", function()
	require("nvim-treesitter-textobjects.select").select_textobject(
		"@parameter.inner",
		"textobjects"
	)
end, "Inside Parameter")


-- Treesitter Movement
key({ "n", "x", "o" }, "]m", function()
	require("nvim-treesitter-textobjects.move").goto_next_start(
		"@function.outer",
		"textobjects"
	)
end, "Next Function")

key({ "n", "x", "o" }, "[m", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start(
		"@function.outer",
		"textobjects"
	)
end, "Previous Function")

key({ "n", "x", "o" }, "]]", function()
	require("nvim-treesitter-textobjects.move").goto_next_start(
		"@class.outer",
		"textobjects"
	)
end, "Next Class")

key({ "n", "x", "o" }, "[[", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start(
		"@class.outer",
		"textobjects"
	)
end, "Previous Class")


-- Treesitter Movement Repeat
key({ "n", "x", "o" }, ";", function()
	require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()
end, "Next Treesitter Object")

key({ "n", "x", "o" }, ",", function()
	require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()
end, "Previous Treesitter Object")




--------------------------------------------------
-- Arrow Keys
--------------------------------------------------

--[[ local function disable_arrow_notification()
	vim.notify("Arrow keys are disabled.", vim.log.levels.WARN, { title = "Navigation Reminder" })
end

key("n", "<Up>", disable_arrow_notification, "Disable Up Arrow")
key("n", "<Down>", disable_arrow_notification, "Disable Down Arrow")
key("n", "<Left>", disable_arrow_notification, "Disable Left Arrow")
key("n", "<Right>", disable_arrow_notification, "Disable Right Arrow")

-- key("i", "<Up>", disable_arrow_notification, "Disable Up Arrow")
-- key("i", "<Down>", disable_arrow_notification, "Disable Down Arrow")
-- key("i", "<Left>", disable_arrow_notification, "Disable Left Arrow")
-- key("i", "<Right>", disable_arrow_notification, "Disable Right Arrow")

key("v", "<Up>", disable_arrow_notification, "Disable Up Arrow")
key("v", "<Down>", disable_arrow_notification, "Disable Down Arrow")
key("v", "<Left>", disable_arrow_notification, "Disable Left Arrow")
key("v", "<Right>", disable_arrow_notification, "Disable Right Arrow") ]]

-- Disable arrow keys in Normal, Insert and Visual modes
for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
	vim.keymap.set({ "n", "v" }, key, "<Nop>", {
		silent = true,
		desc = "Disable arrow key",
	})
end
--------------------------------------------------
-- General
--------------------------------------------------

key("n", "<leader>w", "<cmd>w<CR>", "Save File")
key("n", "<leader>q", "<cmd>q<CR>", "Quit")
-- key("n", "<leader>e", "<cmd>e<CR>", "Reload File")

--------------------------------------------------
-- Editing
--------------------------------------------------

key("v", "p", '"_dP', "Paste Without Yanking")

key({ "n", "v" }, "<leader>y", '"+y', "Yank To Clipboard")

--------------------------------------------------
-- Windows
--------------------------------------------------

key("n", "<C-h>", "<C-w>h", "Focus Left Window")
key("n", "<C-j>", "<C-w>j", "Focus Lower Window")
key("n", "<C-k>", "<C-w>k", "Focus Upper Window")
key("n", "<C-l>", "<C-w>l", "Focus Right Window")

key("n", "<leader>sv", "<cmd>vsplit<CR>", "Vertical Split")
key("n", "<leader>sh", "<cmd>split<CR>", "Horizontal Split")

--------------------------------------------------
-- LSP
-- Will move to lsp.lua later.
--------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),

	callback = function(ev)
		local opts = { buffer = ev.buf }

		-- Navigation
		-- vim.keymap.set("n", "cd", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "ck", vim.lsp.buf.hover, opts)

		-- Actions
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Diagnostics
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		-- -- Formatting
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>fd",
		-- 	function()
		-- 		require("conform").format({
		-- 			async = true,
		-- 			lsp_fallback = true,
		-- 		})
		-- 	end,
		-- 	vim.tbl_extend("force", opts, {
		-- 		desc = "Format Document",
		-- 	})
		-- )
	end,
})
