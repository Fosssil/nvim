local options = {
  formatters_by_ft = {
    assembly = { "asmfmt" },
    ansible = { "prettier" },
    yaml = { "prettier" },
    css = { "prettier" },
    c = { "clang_format" },
    html = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt" },
    shell = { "shfmt" },
    terraform = { "terraform_fmt" },
  },

  -- format_on_save = {
  --   --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
  vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "format documet" }),
}

return options
