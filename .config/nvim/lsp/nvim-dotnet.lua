--lsp config
--eg.: vim.lsp.enable('pylsp')
--vim.lsp.config('csharp_ls', config)
--require("csharpls_extended").buf_read_cmd_bind()

vim.lsp.config.csharp_ls.on_attach = function(client, bufnr)
    require("csharpls_extended").setup {
        -- plugin options
    }
    -- semantic tokens for Neovim 0.11.x
    vim.lsp.semantic_tokens.start(0, vim.lsp.get_clients()[1].id)
end

--vim.lsp.start(vim.lsp.config.csharp_ls)
vim.lsp.enable('csharp_ls')


--require("telescope").load_extension("csharpls_definition")
