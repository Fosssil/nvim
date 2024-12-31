-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ansiblels", "bashls", "pylsp", "yamlls", "clangd", "terraformls", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

require("lspconfig").html.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").ansiblels.setup { filetypes = { "yaml", "yml", "ansible" } }
require("lspconfig").bashls.setup {}
require("lspconfig").pylsp.setup {}
require("lspconfig").yamlls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").terraformls.setup {}
require("lspconfig").rust_analyzer.setup {}
-- require("lspconfig").ansible_language_server.setup {}
-- require("lspconfig").harper_ls.setup {}
-- require("lspconfig").asm_lsp.setup {}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
-- vim.filetype.add({ pattern = { [".*ml"] = "yaml.ansible" } })
