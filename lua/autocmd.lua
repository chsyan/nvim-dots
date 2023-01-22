local cmd = vim.cmd
cmd([[au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*',
    callback = function()
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
        if vim.bo.filetype == 'NvimTree' then
            require'bufferline.api'.set_offset(31, 'FileTree')
        end
    end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
        if vim.fn.expand('<afile>'):match('NvimTree') then
            require'bufferline.api'.set_offset(0)
        end
    end
})

-- Call copilot auth on startup
vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = '*',
    callback = function()
        vim.cmd('silent! Copilot')
    end
})
