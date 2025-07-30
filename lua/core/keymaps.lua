-- ~/.config/nvim/lua/core/keymaps.lua
local map = vim.keymap.set

-- Default options for keymaps
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "

-- 🚫 Function to show reminder
local function disable_arrow_notification()
	vim.notify("Use hjkl! 🧭", vim.log.levels.WARN, { title = "Navigation Reminder" })
end

-- 🚫 Disable arrow keys in normal mode with reminder
vim.keymap.set("n", "<Up>", disable_arrow_notification, { desc = "Disable Up Arrow (Normal mode)" })
vim.keymap.set("n", "<Down>", disable_arrow_notification, { desc = "Disable Down Arrow (Normal mode)" })
vim.keymap.set("n", "<Left>", disable_arrow_notification, { desc = "Disable Left Arrow (Normal mode)" })
vim.keymap.set("n", "<Right>", disable_arrow_notification, { desc = "Disable Right Arrow (Normal mode)" })

-- 🚫 Disable in insert mode
-- vim.keymap.set("i", "<Up>", disable_arrow_notification, { desc = "Disable Up Arrow (Insert mode)" })
-- vim.keymap.set("i", "<Down>", disable_arrow_notification, { desc = "Disable Down Arrow (Insert mode)" })
-- vim.keymap.set("i", "<Left>", disable_arrow_notification, { desc = "Disable Left Arrow (Insert mode)" })
-- vim.keymap.set("i", "<Right>", disable_arrow_notification, { desc = "Disable Right Arrow (Insert mode)" })

-- 🚫 Disable in visual mode
vim.keymap.set("v", "<Up>", disable_arrow_notification, { desc = "Disable Up Arrow (Visual mode)" })
vim.keymap.set("v", "<Down>", disable_arrow_notification, { desc = "Disable Down Arrow (Visual mode)" })
vim.keymap.set("v", "<Left>", disable_arrow_notification, { desc = "Disable Left Arrow (Visual mode)" })
vim.keymap.set("v", "<Right>", disable_arrow_notification, { desc = "Disable Right Arrow (Visual mode)" })

-- Basic keymaps
map("n", "<leader>w", ":w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))
map("n", "<leader>q", ":q<CR>", vim.tbl_extend("force", opts, { desc = "Quit" }))
map("n", "<leader>e", ":e<CR>", vim.tbl_extend("force", opts, { desc = "Reload file" }))

--  Better paste (without overwriting clipboard)
map("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without yanking" }))

--  Clear search highlights
map("n", "<leader>h", ":noh<CR>", vim.tbl_extend("force", opts, { desc = "Clear search highlights" }))

-- Buffer switching
map("n", "<leader>n", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))
map("n", "<leader>p", ":bprev<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))

-- Window navigation
map("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Left Window" }))
map("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Below Window" }))
map("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Above Window" }))
map("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Right Window" }))

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", vim.tbl_extend("force", opts, { desc = "Move line down" }))
map("n", "<A-k>", ":m .-2<CR>==", vim.tbl_extend("force", opts, { desc = "Move line up" }))
map("v", "<A-j>", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selected lines down" }))
map("v", "<A-k>", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selected lines up" }))

-- Close buffer without quitting neovim
map("n", "<leader>bd", ":bp | :bd #<CR>", vim.tbl_extend("force", opts, { desc = "Close buffer", silent = false }))

-- Search navigation
map("n", "n", "nzz", vim.tbl_extend("force", opts, { desc = "Next search, centered" }))
map("n", "N", "Nzz", vim.tbl_extend("force", opts, { desc = "Previous search, centered" }))

-- Yank enhancement
map({ "n", "v" }, "<leader>y", '"+y', vim.tbl_extend("force", opts, { desc = "Yank to clipboard" }))

-- Split Management
map("n", "<leader>sv", ":vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
map("n", "<leader>sh", ":split<CR>", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))

-- Telescope keymaps under <leader>f
-- map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", vim.tbl_extend("force", opts, { desc = "Find files" }))
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", vim.tbl_extend("force", opts, { desc = "Live grep" }))
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", vim.tbl_extend("force", opts, { desc = "Buffers" }))
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", vim.tbl_extend("force", opts, { desc = "Help tags" }))
map("n", "<leader>ff", "<cmd>Telescope file_browser<cr>", vim.tbl_extend("force", opts, { desc = "File Browser" }))
-- map("n", "<leader>fu", "<cmd>Telescope undo<CR>", vim.tbl_extend("force", opts, { desc = "Undo tree" }))
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", vim.tbl_extend("force", opts, { desc = "Git status (diff)" }))

-- Lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		-- Navigation and Action
		vim.keymap.set("n", "cd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "ck", vim.lsp.buf.hover, opts) -- Information
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- rename
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Diagnostics
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		-- Formatting
		map("n", "<leader>fd", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, vim.tbl_extend("force", opts, { desc = "Format Document" }))
	end,
})
