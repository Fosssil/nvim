-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
    order = { "mode", "file", "modified", "git", "%=", "cursor", "diagnostics", "lsp_msg", "lsp", "cwd" },
    modules = {
      modified = function()
        local isModified = vim.bo.modified
        if isModified then
          return " [Modified]"
        end
        return ""
      end
    }

    -- telescope = { style = "bordered" },
    -- modules = {
    --   abc = function()
    --     return "hi"
    --   end,
    --   xyz = "hi",
    --   f = "%F"
    -- }
  },
}
--

return M
