local cc = require('command_center')
local noremap = { noremap = true }
local silent = { silent = true }
local silent_noremap = { silent = true, noremap = true }
local expr = { expr = true }

vim.g.mapleader = ' '

-- Background binds
-- CC doesn't allow for inputing expr so using vim api
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>.
vim.keymap.set('', 'j', 'v:count ? "j" : "gj"', expr)
vim.keymap.set('', 'k', 'v:count ? "k" : "gk"', expr)
vim.keymap.set('', '<Down>', 'v:count ? "j" : "gj"', expr)
vim.keymap.set('', '<Up>', 'v:count ? "k" : "gk"', expr)

cc.add({
	{
		desc = 'Clear highlights',
		cmd = '<cmd>noh<cr>',
		keys = { 'n', '<esc>', noremap },
	},
	{
		desc = "Don't copy the replaced text after pasting in visual mode",
		cmd = '"_dP"',
		keys = { 'v', 'p', noremap },
	},
	{
		desc = 'Split nav down',
		cmd = '<c-w><c-j>',
		keys = { 'n', '<c-j>', noremap },
	},
	{
		desc = 'Split nav up',
		cmd = '<c-w><c-k>',
		keys = { 'n', '<c-k>', noremap },
	},
	{
		desc = 'Split nav left',
		cmd = '<c-w><c-h>',
		keys = { 'n', '<c-h>', noremap },
	},
	{
		desc = 'Split nav right',
		cmd = '<c-w><c-l>',
		keys = { 'n', '<c-l>', noremap },
	},
	{
		desc = 'Split resize up',
		cmd = '<cmd>resize +1<cr>',
		keys = { 'n', '<c-s-k>', noremap },
	},
	{
		desc = 'Split resize down',
		cmd = '<cmd>resize -1<cr>',
		keys = { 'n', '<c-s-j>', noremap },
	},
	{
		desc = 'Split resize left',
		cmd = '<cmd>vertical resize -1<cr>',
		keys = { 'n', '<c-s-h>', noremap },
	},
	{
		desc = 'Split resize right',
		cmd = '<cmd>vertical resize +1<cr>',
		keys = { 'n', '<c-s-l>', noremap },
	},
	{
		desc = 'Indent visual block',
		cmd = '>gv',
		keys = { 'v', '>', noremap },
	},
	{
		desc = 'Unindent visual block',
		cmd = '<gv',
		keys = { 'v', '<', noremap },
	},
	{
		desc = 'One less keystroke',
		cmd = ':',
		keys = { 'n', ';', noremap },
	},
	{
		desc = 'Move visual up',
		cmd = ":m '<-2<cr>gv=gv",
		keys = { 'v', 'K', noremap },
	},
	{
		desc = 'Move visual down',
		cmd = ":m '>+1<cr>gv=gv",
		keys = { 'v', 'J', noremap },
	},
	{
		desc = "Don't move cursor on shift+j",
		cmd = 'mzJ`z',
		keys = { 'n', 'J', noremap },
	},
	{
		desc = 'Keep cursor center on page up',
		cmd = '<c-u>zz',
		keys = { 'n', '<c-u>', noremap },
	},
	{
		desc = 'Keep cursor center on page down',
		cmd = '<c-d>zz',
		keys = { 'n', '<c-d>', noremap },
	},
	{
		desc = 'Keep search terms in middle',
		cmd = 'nzzzv',
		keys = { 'n', 'n', noremap },
	},
	{
		desc = 'Keep search terms in middle',
		cmd = 'Nzzzv',
		keys = { 'n', 'N', noremap },
	},
	{
		desc = 'Search and replace current word',
		cmd = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
		keys = { 'n', '<leader>s', noremap },
	},
	{
		desc = 'chmod +x current file',
		cmd = '<cmd>!chmod +x %<cr>',
		keys = { 'n', '<leader>x', noremap },
	},
})

-- Plugin binds

-- Telescope
local builtin = require('telescope.builtin')
local telescope = require('telescope')
cc.add(
	{
		{
			desc = 'Telescope find files',
			cmd = builtin.find_files,
			keys = { 'n', '<leader>ff', noremap },
		},
		{
			desc = 'Telescope live grep',
			cmd = builtin.live_grep,
			keys = { 'n', '<leader>lg', noremap },
		},
		{
			desc = 'Find git files',
			cmd = builtin.git_files,
			keys = { 'n', '<leader>gf', noremap },
		},
		{
			desc = 'Open command center',
			cmd = telescope.extensions.command_center.command_center,
			keys = { 'n', '<c-s-p>', noremap },
		},
		{
			desc = 'Open projects',
			cmd = telescope.extensions.projects.projects,
			keys = { 'n', '<c-p>', noremap },
		}
	},
	{
		category = 'Telescope'
	})

-- Harpoon
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
cc.add(
	{
		{
			desc = 'Mark file',
			cmd = mark.add_file,
			keys = { 'n', '<leader>ha', noremap },
		},
		{
			desc = 'Harpoons marks menu',
			cmd = ui.toggle_quick_menu,
			keys = { 'n', '<leader>hm', noremap },
		},
		{
			desc = 'Previous mark',
			cmd = ui.nav_prev,
			keys = { 'n', '<c-q>', noremap },
		},
		{
			desc = 'Next mark',
			cmd = ui.nav_next,
			keys = { 'n', '<c-e>', noremap },
		},
		{
			desc = 'Goto mark 1',
			cmd = function() ui.nav_file(1) end,
			keys = { 'n', '<c-1>', noremap },
		},
		{
			desc = 'Goto mark 2',
			cmd = function() ui.nav_file(2) end,
			keys = { 'n', '<c-2>', noremap },
		},
		{
			desc = 'Goto mark 3',
			cmd = function() ui.nav_file(3) end,
			keys = { 'n', '<c-3>', noremap },
		},
		{
			desc = 'Goto mark 4',
			cmd = function() ui.nav_file(4) end,
			keys = { 'n', '<c-4>', noremap },
		},
	},
	{
		category = 'Harpoon'
	})

-- Open plugins
local neogit = require('neogit')
local git = require('gitsigns')
cc.add({
	{
		desc = 'Toggle undo tree',
		cmd = vim.cmd.UndotreeToggle,
		keys = { 'n', '<leader>u', noremap },
		category = 'Undo tree'
	},
	{
		desc = 'Toggle Neotree',
		cmd = '<cmd>Neotree toggle<cr>',
		keys = { 'n', '\\', noremap },
		category = 'Neotree'
	},
	{
		desc = 'Open Neogit',
		cmd = neogit.open,
		keys = { 'n', '<leader>n', noremap },
		category = 'Neogit'
	},
	{
		desc = 'Git status',
		cmd = vim.cmd.Git,
		keys = { 'n', '<leader>gs', noremap },
		category = 'Fugitive'
	}
})

-- Bufferline
cc.add(
	{
		{
			desc = 'Close buffer',
			cmd = vim.cmd.bdelete,
			keys = { 'n', '<m-w>', noremap },
		},
		{
			desc = 'Next buffer',
			cmd = vim.cmd.bn,
			keys = { 'n', '<m-e>', noremap },
		},
		{
			desc = 'Previous bufer',
			cmd = vim.cmd.bp,
			keys = { 'n', '<m-q>', noremap },
		},
		{
			desc = 'Move buffer left',
			cmd = vim.cmd.BufferLineMovePrev,
			keys = { 'n', '<m-s-q>', noremap },
		},
		{
			desc = 'Move bufer right',
			cmd = vim.cmd.BufferLineMoveNext,
			keys = { 'n', '<m-s-e>', noremap },
		},
		{
			desc = 'Pin buffer',
			cmd = vim.cmd.BufferLineTogglePin,
			keys = { 'n', '<m-p>', noremap },
		}
	},
	{
		category = 'Bufferline'
	}
)

-- LSP.
cc.add(
	{
		{
			desc = 'Previous diagnostic',
			cmd = vim.diagnostic.goto_prev,
		},
		{
			desc = 'Next diagnostic',
			cmd = vim.diagnostic.goto_next,
		},
		{
			desc = 'Open diagnostic',
			cmd = vim.diagnostic.open_float,
		},
		{
			desc = 'Go to definition',
			cmd = vim.lsp.buf.definition,
		},
		{
			desc = 'Show implementation',
			cmd = vim.lsp.buf.implementation,
		},
		{
			desc = 'Go to declaration (Some lsp don\'t support this, see definition instead)',
			cmd = vim.lsp.buf.declaration,
		},
		{
			desc = 'Signature help',
			cmd = vim.lsp.buf.signature_help,
		},
		{
			desc = 'Hover',
			cmd = vim.lsp.buf.hover,
		},
		{
			desc = 'Format',
			cmd = function() vim.lsp.buf.format({async = true}) end,
			keys = {
				{ 'n', '<m-s-f>', noremap },
				{ 'v', '<m-s-f>', noremap },
				{ 'i', '<m-s-f>', noremap }
			},
		},
		{
			desc = 'Code action',
			cmd = vim.lsp.buf.code_action,
		},
		{
			desc = 'Rename',
			cmd = vim.lsp.buf.rename,
		},
		{
			desc = 'References',
			cmd = vim.lsp.buf.references,
		},
		{
			desc = 'Type definition',
			cmd = vim.lsp.buf.type_definition,
		}
	},
	{
		category = 'LSP'
	})
