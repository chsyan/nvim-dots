require('bufferline').setup {
    options = {
        always_show_bufferline = false,
        offsets = {{
            filetype = "neo-tree",
            text = function()
                return vim.fn.getcwd()
            end,
            highlight = "Directory",
            separator = true,
            text_align = "left"
        }}
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get()
}
