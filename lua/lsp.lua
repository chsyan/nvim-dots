require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
-- lsp.preset('recommended')
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

-- For copilot tab completion
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),

  -- Scroll docs
  ['<C-k>'] = cmp.mapping.scroll_docs(-4),
  ['<C-j>'] = cmp.mapping.scroll_docs(4),

  -- go to next placeholder in the snippet
  ['<C-f>'] = cmp.mapping(function(fallback)
    if luasnip.jumpable(1) then
      luasnip.jump(1)
    else
      fallback()
    end
  end, {'i', 's'}),

  -- Confirm
  ['<CR>'] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Replace,
    select = false
  }),

  -- go to previous placeholder in the snippet
  ['<C-b>'] = cmp.mapping(function(fallback)
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {'i', 's'}),

  -- Copilot tab completion
  ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
})

local lspkind = require('lspkind')
lspkind.init({
  symbol_map = {
    Copilot = "",
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
lsp.setup_nvim_cmp({
  formatting = {
    fields = {'kind', 'abbr', 'menu'},
    format = lspkind.cmp_format({
      with_text = false,
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  },
  documentation = {
    max_height = 15,
    max_width = 60,
    border = 'rounded',
    col_offset = 0,
    side_padding = 1,
    winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    zindex = 1001
  },
  preselect = 'none',
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect'
  },
  mapping = cmp_mappings,
  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
