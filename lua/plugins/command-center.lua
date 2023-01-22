local command_center = require("command_center")
local noremap = {
    noremap = true
}
local silent_noremap = {
    noremap = true,
    silent = true
}

-- https://github.com/FeiyouG/command_center.nvim
-- Add keybinds
-- command_center.add({{
--     desc = "Open command_center",
--     cmd = "<CMD>Telescope command_center<CR>",
--     keys = {{"n", "<Leader>fc", noremap}, {"v", "<Leader>fc", noremap},
-- 
--     -- If ever hesitate when using telescope start with <leader>f,
--     -- also open command center
--             {"n", "<Leader>f", noremap}, {"v", "<Leader>f", noremap}}
-- }}, command_center.mode.REGISTER_ONLY)
-- 
