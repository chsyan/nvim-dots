local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                  install_path})
end

local use = require('packer').use

return require('packer').startup({
    function()
        use {'wbthomason/packer.nvim'}
        use {'nvim-lua/plenary.nvim'}
        use {'nvim-lua/popup.nvim'}
        use {
            'kyazdani42/nvim-web-devicons',
            event = 'BufEnter'
        }

        -- Colorscheme
        use {
            "catppuccin/nvim",
            as = "catppuccin"
        }

        -- LSP zero sensible defaults
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = { -- LSP Support
            {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lua'}, -- Snippets
            {'L3MON4D3/LuaSnip'}, {'rafamadriz/friendly-snippets'}, -- Symbols
            {'onsails/lspkind.nvim'}}
        }

        -- LSP loader
        use {
            'j-hui/fidget.nvim',
            config = function()
                require('fidget').setup({
                    window = {
                        blend = 0
                    }
                })
            end
        }

        -- Copilot
        use {
            'zbirenbaum/copilot.lua',
            cmd = 'Copilot',
            config = function()
                require("copilot").setup({
                    suggestion = {
                        enabled = true,
                        auto_trigger = true,
                        debounce = 75,
                        keymap = {
                            accept = "<M-l>",
                            accept_word = false,
                            accept_line = false,
                            next = "<M-j>",
                            prev = "<M-k>",
                            dismiss = "<C-h>"
                        }
                    },
                    panel = {
                        enabled = false
                    },
                    filetypes = {
                        ["."] = true
                    }
                })
            end
        }
        use {
            "zbirenbaum/copilot-cmp",
            after = "copilot.lua",
            config = function()
                require("copilot_cmp").setup({
                    method = "getCompletionsCycling",
                    formatters = {
                        insert_text = require("copilot_cmp.format").remove_existing
                    }
                })
            end
        }

        -- Telescope extensions
        -- Fuzzy finder native
        use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        }
        -- LSP actions
        use {'gbrlsnchs/telescope-lsp-handlers.nvim'}
        -- Preview media files
        use {'nvim-telescope/telescope-media-files.nvim'}
        -- Tab selection
        use {
            'LukasPietzschmann/telescope-tabs',
            config = function()
                require'telescope-tabs'.setup()
            end
        }
        -- Commands
        use {
            "FeiyouG/command_center.nvim",
            config = function()
                require('plugins/command-center')
            end
        }

        -- Telescope
        use {
            'nvim-telescope/telescope.nvim',
            -- Undo tree
            requires = 'debugloop/telescope-undo.nvim',
            tag = '0.1.1',
            config = function()
                require('plugins/telescope')
            end
        }

        -- Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require('plugins/treesitter')
            end
        }

        -- Harpoon navigation
        use {
            'ThePrimeagen/harpoon',
            config = function()
                require('plugins/harpoon')
            end
        }

        -- Undotree
        use {'mbbill/undotree'}

        if packer_bootstrap then
            require('packer').sync()
        end

        -- Indent lines
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require("indent_blankline").setup({
                    -- for example, context is off by default, use this to turn it on
                    show_current_context = true,
                    show_current_context_start = true
                })
            end
        }

        -- Git signs
        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup({
                    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                    current_line_blame_opts = {
                        virt_text = true,
                        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                        delay = 1000,
                        ignore_whitespace = false
                    }
                })
            end
        }

        -- Neogit
        use {
            'TimUntersberger/neogit',
            requires = 'sindrets/diffview.nvim',
            config = function()
                require('plugins/neogit')
            end
        }

        -- Bufferline
        use {
            'akinsho/bufferline.nvim',
            tag = 'v3.*',
            after = "catppuccin",
            config = function()
                require('plugins/bufferline')
            end
        }

        -- Statusline
        use {
            'nvim-lualine/lualine.nvim',
            config = function()
                require('plugins/lualine')
            end
        }

        -- Neotree file explorer
        use {
            'nvim-neo-tree/neo-tree.nvim',
            branch = 'v2.x',
            requires = 'MunifTanjim/nui.nvim',
            config = function()
                require('plugins/neotree')
            end
        }

        -- Remove trailing whitespace
        use {
            'echasnovski/mini.trailspace',
            config = function()
                require('mini.trailspace').setup()
            end
        }

        -- Pairs
        use {
            'echasnovski/mini.pairs',
            config = function()
                require('mini.pairs').setup()
            end
        }

        -- Tags
        use {
            'windwp/nvim-ts-autotag',
            config = function()
                require('nvim-ts-autotag').setup()
            end
        }

        -- Surround
        use {
            'echasnovski/mini.surround',
            config = function()
                require('mini.surround').setup()
            end
        }

        -- Code outline
        use {
            'simrat39/symbols-outline.nvim',
            config = function()
                require('symbols-outline').setup()
            end
        }

        -- Trouble list diagnostics
        use {
            "folke/trouble.nvim",
            requires = "nvim-tree/nvim-web-devicons",
            config = function()
                require("plugins/trouble")
            end
        } -- Color highlighter
        use {
            'norcalli/nvim-colorizer.lua',
            config = function()
                require('colorizer').setup({
                    '*',
                    css = {
                        rgb_fn = true
                    }
                })
            end
        }

    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({
                    border = 'single'
                })
            end
        }
    }
})
