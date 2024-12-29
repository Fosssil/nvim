vim.cmd("set showmatch")
vim.cmd("set relativenumber")
vim.cmd("set ignorecase")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set number")
vim.cmd("set wildmode=longest,list")
vim.cmd("set mouse=")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set cursorline")
vim.cmd("set ttyfast")
vim.cmd("syntax on")
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
