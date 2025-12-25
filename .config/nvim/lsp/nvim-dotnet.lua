--lsp config
--eg.: vim.lsp.enable('pylsp')
--vim.lsp.config('csharp_ls', config)
--require("csharpls_extended").buf_read_cmd_bind()


require("roslyn").setup({
  config = {
    settings = {
      ["csharp|inlay_hints"] = {
        csharp_enable_inlay_hints_for_types = true,
        csharp_enable_inlay_hints_for_parameters = true,
      },
    },
  },
})


--[[
-- csharpls
vim.lsp.config.csharp_ls.on_attach = function(client, bufnr)
    -- semantic tokens for Neovim 0.11.x
    vim.lsp.semantic_tokens.start(0, vim.lsp.get_clients()[1].id)
end

--vim.lsp.start(vim.lsp.config.csharp_ls)
local cslsext = require('csharpls_extended').handler
vim.lsp.config('csharp_ls', {
    handlers = {
        ["textDocument/definition"] = cslsext,
        ["textDocument/typeDefinition"] = cslsext,
    },


})

vim.lsp.enable('csharp_ls')
--]]


--require("telescope").load_extension("csharpls_definition")



