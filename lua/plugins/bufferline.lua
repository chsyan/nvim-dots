local mocha = require("catppuccin.palettes").get_palette("mocha")
require('bufferline').setup {
	options = {
		always_show_bufferline = true,
		offsets = { {
			filetype = "neo-tree",
			text = function()
				return vim.fn.getcwd()
			end,
			highlight = "Directory",
			separator = true,
			text_align = "left"
		} },
		separator_style = "thin",
		-- hover = {
		-- 	enabled = true,
		-- 	delay = 200,
		-- 	reveal = { 'close' }
		-- }
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get({
		custom = {
			mocha = {
				fill = { bg = mocha.base },
			},
		},
	})
}
