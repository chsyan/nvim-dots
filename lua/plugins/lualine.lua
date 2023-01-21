local present, lualine = pcall(require, "lualine")
if not present then
    return
end

lualine.setup {
  options = {
    theme = 'auto',
    disabled_filetypes = { 'NvimTree' },
    component_separators = '|',
    section_separators = { left = '', right = '' },
    globalstatus = true
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename', 'filesize' },
    lualine_c = {
      'location', 'progress',
      {
        'diagnostics',
        update_in_insert = true,
        always_visible = false,
      },
      {
        'lsp_progress',
        display_components = { 'lsp_client_name' },
        separators = { lsp_client_name = { pre = 'Init [', post = ']...' } },
      },
 },
    lualine_x = { 'encoding', 'filetype', 'branch', 'diff' },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {'fugitive'},
}

