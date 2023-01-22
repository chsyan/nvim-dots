vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
local cp = require("catppuccin")

cp.setup({
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15
	},
	transparent_background = false,
	term_colors = false,
	compile = {
		enabled = true,
		path = vim.fn.stdpath "cache" .. "/catppuccin"
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {}
	},
	integrations = {
		aerial = false,
		barbar = false,
		beacon = false,
		cmp = true,
		coc_nvim = false,
		dashboard = false,
		fern = false,
		fidget = true,
		gitgutter = false,
		gitsigns = true,
		harpoon = true,
		hop = false,
		illuminate = false,
		leap = false,
		lightspeed = false,
		lsp_saga = false,
		lsp_trouble = false,
		markdown = false,
		mason = true,
		mini = false,
		neogit = true,
		neotest = false,
		neotree = false,
		noice = false,
		notify = false,
		nvimtree = false,
		overseer = false,
		pounce = false,
		semantic_tokens = false,
		symbols_outline = true,
		telekasten = false,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = false,

		-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
		barbecue = {
			dim_dirname = false
		},
		dap = {
			enabled = false,
			enable_ui = false
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" }
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" }
			}
		},
		navic = {
			enabled = false,
			custom_bg = "NONE"
		}
	},
	color_overrides = {},
	highlight_overrides = {}
})

vim.cmd [[colorscheme catppuccin]]
