-- ~/.config/nvim/lua/plugins/comment-box.lua
return {
	"LudoPinelli/comment-box.nvim",

	cmd = {
		"CBline",
		"CBllline",
		"CBllbox",
		"CBcatalog",
		"CBd",
	},

	opts = {
		comment_style = "auto",

		doc_width = 100,
		box_width = 70,
		line_width = 90,

		outer_blank_lines_above = false,
		outer_blank_lines_below = false,
		inner_blank_lines = false,

		line_blank_line_above = false,
		line_blank_line_below = false,
	},
}
