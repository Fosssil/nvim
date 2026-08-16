-- ~/.config/nvim/lua/keymaps/buffers.lua

local map = vim.keymap.set

--------------------------------------------------
-- Buffer Navigation
--------------------------------------------------

map("n", "<leader>bn", "<cmd>bnext<CR>", {
	desc = "Next Buffer",
})

map("n", "<leader>bp", "<cmd>bprevious<CR>", {
	desc = "Previous Buffer",
})

--------------------------------------------------
-- Buffer Management
--------------------------------------------------

map("n", "<leader>bd", "<cmd>Bdelete<CR>", {
	desc = "Delete Buffer",
})

--------------------------------------------------
-- Buffer list
--------------------------------------------------

map("n", "<leader>bl", "<cmd>Telescope buffers<CR>", {
	desc = "Buffer List",
})
