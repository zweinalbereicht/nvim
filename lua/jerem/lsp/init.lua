local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jerem.lsp.lsp-installer"
require("jerem.lsp.handlers").setup()
require 'jerem.lsp.null-ls'
