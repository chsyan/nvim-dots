local present, treesitter = pcall(require, 'nvim-treesitter.configs')
if not present then
    return
end

treesitter.setup {
  ensure_installed = 'all',
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true
  },
}
