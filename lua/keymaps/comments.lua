-- ~/.config/nvim/lua/keymaps/comments.lua

local map = vim.keymap.set
--------------------------------------------------
-- Commenting
--------------------------------------------------

-- Line comment
map("n", "<leader>/", "gcc", {
	remap = true,
	desc = "Comment Line",
})

map("x", "<leader>/", "gc", {
	remap = true,
	desc = "Comment Selection",
})

-- Block comment
map("n", "<leader>?", "gbc", {
	remap = true,
	desc = "Block Comment Line",
})

map("x", "<leader>?", "gb", {
	remap = true,
	desc = "Block Comment Selection",
})

--------------------------------------------------
-- Comment Box
--------------------------------------------------

map({ "n", "x" }, "<leader>cb", "<cmd>CBllbox<CR>", {
	desc = "Comment Box",
})

map("n", "<leader>cl", "<cmd>CBline<CR>", {
	desc = "Comment Line",
})

map({ "n", "x" }, "<leader>ct", "<cmd>CBllline<CR>", {
	desc = "Comment Box with Title",
})
