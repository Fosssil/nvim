-- ~/.config/nvim/lua/core/options.lua
local opt = vim.opt

-- Basic UI settings
opt.shortmess:append("I") -- Skip intro
opt.mouse = "a" -- Mouse support is 'on'
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.cursorline = true -- Highlight cursorline
-- opt.cursorcolumn = true                               -- Highlight cursorcolumn
opt.laststatus = 3 -- Global statusline
opt.linebreak = true -- Prevent mid-word splitting
opt.cmdheight = 0 -- New cmdline popup UX
opt.list = false -- Shows invisible characters
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Tabs, trailing spaces
opt.formatoptions:remove({ "c", "r", "o" }) -- Don't auto comment new lines
opt.scrolljump = 5 -- Smooth scroll
-- opt.colorcolumn = "80"                      -- Highlights column 80
opt.errorbells = false -- Disable error bell
opt.visualbell = false -- Disable visual bell

-- Behaviour
opt.mousemodel = "extend" -- Better mouse behavior on selecting/scrolling
opt.inccommand = "split" -- Previews substitutions
opt.clipboard = "unnamedplus" -- System clipboard sync
opt.scrolloff = 8 -- Keep content visible '8' lines below and above
opt.undofile = true -- Persistent undo without swap clutter
opt.swapfile = false -- Turn off swap file
opt.signcolumn = "yes" -- vertical column to the left of the line numbers
opt.confirm = true -- Confirm to save before exiting
opt.modeline = true -- Special comments in files that set buffer-local options
opt.completeopt = { "menu", "menuone", "noselect" } -- Completion menu behavior

-- Indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- Autoindent
opt.smartindent = true -- Auto-indent new lines
opt.breakindent = true -- Wrap indent visually
opt.shiftround = true -- Rounds indentations

-- Search
opt.ignorecase = true -- Ignore case...
opt.smartcase = true -- ...unless capital in search
opt.hlsearch = true -- Highlight matches
opt.incsearch = true -- Incremental search
opt.wrapscan = false -- Search stop at file end

-- Split behavior
opt.splitbelow = true -- Horizontal splits below
opt.splitright = true -- Vertical splits to the right

-- Performance
opt.updatetime = 250 -- Faster completion
opt.timeoutlen = 300 -- Faster mapped sequences
opt.lazyredraw = true -- Optimization for macros or fast edits
