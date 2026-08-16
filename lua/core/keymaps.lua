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

key("n", "<leader>h", "<cmd>nohlsearch<CR>", "Clear Search Highlight")

key("n", "<A-j>", ":m .+1<CR>==", "Move Line Down")
key("n", "<A-k>", ":m .-2<CR>==", "Move Line Up")

key("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move Selected Lines Down")
key("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move Selected Lines Up")

key({ "n", "v" }, "<leader>y", '"+y', "Yank To Clipboard")

--------------------------------------------------
-- Search
--------------------------------------------------

key("n", "n", "nzz", "Next Search Result")
key("n", "N", "Nzz", "Previous Search Result")

--------------------------------------------------
-- Buffers
--------------------------------------------------

--[[ key("n", "<leader>n", "<cmd>bnext<CR>", "Next Buffer")
key("n", "<leader>p", "<cmd>bprevious<CR>", "Previous Buffer")

key("n", "<leader>bd", "<cmd>bp | bd #<CR>", "Close Buffer", { silent = false }) ]]

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
-- Telescope (Temporary)
-- Will move to telescope.lua later.
--------------------------------------------------

key("n", "<leader>ff", "<cmd>Telescope file_browser<CR>", "File Browser")
key("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", "Live Grep")
key("n", "<leader>fb", "<cmd>Telescope buffers<CR>", "Buffers")
key("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", "Help Tags")
key("n", "<leader>gt", "<cmd>Telescope git_status<CR>", "Git Status")

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
