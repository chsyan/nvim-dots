local opt = vim.opt
local g = vim.g
local fn = vim.fn

-- Disable tilde on end of buffer.
opt.fillchars = { eob = " " }

opt.termguicolors = true
opt.completeopt = {"menuone", "noselect"}
opt.ruler = false
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 2
opt.updatetime = 250
opt.timeoutlen = 500
opt.clipboard = "unnamedplus"
opt.scrolloff = 8
opt.lazyredraw = true
opt.linebreak = true

opt.cursorline = true
opt.colorcolumn = "121"

opt.undodir = fn.stdpath('cache').."/undodir"
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.undofile = true

opt.number = true
vim.opt.relativenumber = true
opt.numberwidth = 4

opt.expandtab = false
-- opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smarttab = true
opt.smartindent = true

opt.shortmess:append("casI")

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

