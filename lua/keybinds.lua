local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Set cr for clearing highlights after searching word in file.
map('n', '<Esc>', ':noh<CR>', { silent = true })

-- Don't copy the replaced text after pasting in visual mode.
map('v', 'p', '"_dP')

-- Split navigations.
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-h>', '<C-w><C-h>')

-- Split resize.
map('n', '<C-Up>', ':resize +1<CR>')
map('n', '<C-Down>', ':resize -1<CR>')
map('n', '<C-Right>', ':vertical resize +1<CR>')
map('n', '<C-Left>', ':vertical resize -1<CR>')

-- Indent visual block.
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Less keystrokes.
map('n', ';', ':')

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>.
map('', 'j', 'v:count ? "j" : "gj"', { expr = true })
map('', 'k', 'v:count ? "k" : "gk"', { expr = true })
map('', '<Down>', 'v:count ? "j" : "gj"', { expr = true })
map('', '<Up>', 'v:count ? "k" : "gk"', { expr = true })

-- NvimTree
map('n', '<leader>ee', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>er', ':NvimTreeRefresh<CR>', { silent = true })

-- Telescope.
map("n", "<Leader>tfg", ":Telescope live_grep<CR>")
map("n", "<Leader>tc", ":Telescope git_commits<CR>")
map("n", "<Leader>tff", ":Telescope find_files<CR>")
map("n", "<Leader>tm", ":lua require('telescope').extensions.media_files.media_files()<CR>")
map("n", "<Leader>tb", ":Telescope buffers<CR>")
map("n", "<Leader>td", ":TodoTelescope")

-- Undotree
map('n', '<leader>u', ':UndotreeToggle<CR>')

-- Neogit
map('n', '<leader>n', ':Neogit<CR>')

-- LSP.
map('n', '<leader>,', ':lua vim.diagnostic.goto_prev()<CR>')
map('n', '<leader>.', ':lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>/', ':lua vim.diagnostic.open_float()<CR>')
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', '<leader>s', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>h', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>f', ':lua vim.lsp.buf.format{async = true}<CR>')
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>rf', ':lua vim.lsp.buf.references()<CR>')

-- Bufferline
map('n', '<A-l>', ':BufferLineCycleNext<CR>')
map('n', '<A-h>', ':BufferLineCyclePrev<CR>')
map('n', '<A-L>', ':BufferLineMoveNext<CR>')
map('n', '<A-H>', ':BufferLineMovePrev<CR>')
map('n', '<A-p>', ':BufferLineTogglePin<CR>')
map('n', '<A-1>', ':BufferLineGoToBuffer1<CR>')
map('n', '<A-2>', ':BufferLineGoToBuffer2<CR>')
map('n', '<A-3>', ':BufferLineGoToBuffer3<CR>')
map('n', '<A-4>', ':BufferLineGoToBuffer4<CR>')
map('n', '<A-5>', ':BufferLineGoToBuffer5<CR>')
map('n', '<A-6>', ':BufferLineGoToBuffer6<CR>')
map('n', '<A-7>', ':BufferLineGoToBuffer7<CR>')
map('n', '<A-8>', ':BufferLineGoToBuffer8<CR>')
map('n', '<A-9>', ':BufferLineGoToBuffer9<CR>')
