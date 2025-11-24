--lsp config
--eg.: vim.lsp.enable('pylsp')
vim.lsp.config('csharp_ls', config)
require("csharpls_extended").buf_read_cmd_bind()
--require("telescope").load_extension("csharpls_definition")
