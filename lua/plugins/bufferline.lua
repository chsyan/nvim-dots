require('bufferline').setup {
	options = {
		always_show_bufferline = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Files",
				highlight = "Directory",
				separator = true
			}
		}
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get()
}
