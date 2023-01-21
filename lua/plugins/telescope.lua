local present, telescope = pcall(require, 'telescope')
if not present then
    return
end

telescope.setup {
  extensions = {
    media_files = {
      filetypes = {"png", "jpg", "mp4", "webm", "pdf"},
      find_cmd = "rg",
    }
  },
}

telescope.load_extension('fzf')
telescope.load_extension('media_files')
