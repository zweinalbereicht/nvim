--cmp setip
require 'config.lsp.cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'sumneko_lua', 'clangd', 'bashls', 'html', 'cssls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = require('config.lsp.keymaps').on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

-- add formatting on save as autocomanf
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { '*.rs', '*.py', '*.lua', '*.html', '*.css', '*.cpp' },
  callback = vim.lsp.buf.formatting,
})
