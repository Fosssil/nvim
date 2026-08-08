local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")
local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

-- Selection
for _, mode in ipairs({ "x", "o" }) do
	vim.keymap.set(mode, "af", function()
		select.select_textobject("@function.outer", "textobjects")
	end)

	vim.keymap.set(mode, "if", function()
		select.select_textobject("@function.inner", "textobjects")
	end)

	vim.keymap.set(mode, "ac", function()
		select.select_textobject("@class.outer", "textobjects")
	end)

	vim.keymap.set(mode, "ic", function()
		select.select_textobject("@class.inner", "textobjects")
	end)

	vim.keymap.set(mode, "aa", function()
		select.select_textobject("@parameter.outer", "textobjects")
	end)

	vim.keymap.set(mode, "ia", function()
		select.select_textobject("@parameter.inner", "textobjects")
	end)
end

-- Movement
vim.keymap.set({ "n", "x", "o" }, "]m", function()
	move.goto_next_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
	move.goto_previous_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]]", function()
	move.goto_next_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[[", function()
	move.goto_previous_start("@class.outer", "textobjects")
end)

-- Repeat motions
vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)

vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })
