local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then
    return
end

require'lspconfig'.eslint.setup {
    format = true
}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*.tsx', '*.ts', '*.jsx', '*.js'},
    command = 'silent! EslintFixAll',
    group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {})
})

-- TypeScript
nvim_lsp.tsserver.setup {
    filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
    cmd = {"typescript-language-server", "--stdio"}
}
