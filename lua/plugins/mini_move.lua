-- ~/.config/nvim/lua/plugins/mini-move.lua
return {
	"nvim-mini/mini.move",
	version = false,

	opts = {
		mappings = {
			------------------------------------------------------------------
			-- We will redesign these later with the rest of Nocturne's
			-- keymap system. Disable defaults for now.
			------------------------------------------------------------------
			left = "",
			right = "",
			down = "",
			up = "",

			line_left = "",
			line_right = "",
			line_down = "",
			line_up = "",
		},

		options = {
			------------------------------------------------------------------
			-- Reindent moved code automatically.
			------------------------------------------------------------------
			reindent_linewise = true,
		},
	},
}
