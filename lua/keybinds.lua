vim.g.mapleader = ' '

-- Set cr for clearing highlights after searching word in file.
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Don't copy the replaced text after pasting in visual mode.
vim.keymap.set('v', 'p', '"_dP')

-- Split navigations.
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')

-- Split resize.
vim.keymap.set('n', '<C-Up>', ':resize +1<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -1<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +1<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -1<CR>')

-- Indent visual block.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Less keystrokes.
vim.keymap.set('n', ';', ':')

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>.
vim.keymap.set('', 'j', 'v:count ? "j" : "gj"', { expr = true })
vim.keymap.set('', 'k', 'v:count ? "k" : "gk"', { expr = true })
vim.keymap.set('', '<Down>', 'v:count ? "j" : "gj"', { expr = true })
vim.keymap.set('', '<Up>', 'v:count ? "k" : "gk"', { expr = true })

-- Move visual
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<cr>gv=gv")

-- Don't move cursor on shift+j
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep cursor center on page up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep search terms in middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keep clipboards separate
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Replace current word
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Chmod +x current file
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>')

-- Telescope.
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- Harpoon
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hm', '<cmd>Telescope harpoon marks<cr>')
vim.keymap.set('n', '<C-q>', ui.nav_prev)
vim.keymap.set('n', '<C-e>', ui.nav_next)

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- LSP.
-- vim.keymap.set('n', '<leader>,', ':lua vim.diagnostic.goto_prev()<CR>')
-- vim.keymap.set('n', '<leader>.', ':lua vim.diagnostic.goto_next()<CR>')
-- vim.keymap.set('n', '<leader>/', ':lua vim.diagnostic.open_float()<CR>')
-- vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
-- vim.keymap.set('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
-- vim.keymap.set('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>')
-- vim.keymap.set('n', '<leader>s', ':lua vim.lsp.buf.signature_help()<CR>')
-- vim.keymap.set('n', '<leader>h', ':lua vim.lsp.buf.hover()<CR>')
-- vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format{async = true}<CR>')
-- vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
-- vim.keymap.set('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
-- vim.keymap.set('n', '<leader>rf', ':lua vim.lsp.buf.references()<CR>')

-- Bufferline
vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<A-L>', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', '<A-H>', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', '<A-p>', ':BufferLineTogglePin<CR>')
vim.keymap.set('n', '<A-1>', ':BufferLineGoToBuffer1<CR>')
vim.keymap.set('n', '<A-2>', ':BufferLineGoToBuffer2<CR>')
vim.keymap.set('n', '<A-3>', ':BufferLineGoToBuffer3<CR>')
vim.keymap.set('n', '<A-4>', ':BufferLineGoToBuffer4<CR>')
vim.keymap.set('n', '<A-5>', ':BufferLineGoToBuffer5<CR>')
vim.keymap.set('n', '<A-6>', ':BufferLineGoToBuffer6<CR>')
vim.keymap.set('n', '<A-7>', ':BufferLineGoToBuffer7<CR>')
vim.keymap.set('n', '<A-8>', ':BufferLineGoToBuffer8<CR>')
vim.keymap.set('n', '<A-9>', ':BufferLineGoToBuffer9<CR>')
