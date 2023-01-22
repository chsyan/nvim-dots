local telescope = require('telescope')
telescope.setup({
    extensions = {
        media_files = {
            filetypes = {"png", "jpg", "mp4", "webm", "pdf"},
            find_cmd = "rg"
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        lsp_handlers = {
            code_action = {
                telescope = require('telescope.themes').get_dropdown({})
            }
        },
        undo = {
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.8
            },
            use_delta = true,
            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
            side_by_side = true,
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            mappings = {
                i = {
                    -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                    -- you want to replicate these defaults and use the following actions. This means
                    -- installing as a dependency of telescope in it's `requirements` and loading this
                    -- extension from there instead of having the separate plugin definition as outlined
                    -- above.
                    ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-cr>"] = require("telescope-undo.actions").restore
                }
            }
        }
    }
})

telescope.load_extension('fzf')
telescope.load_extension('media_files')
telescope.load_extension('undo')
telescope.load_extension('lsp_handlers')
telescope.load_extension('harpoon')
telescope.load_extension("command_center")
