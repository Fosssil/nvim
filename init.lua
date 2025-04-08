-- Faster startup
vim.loader.enable()

-- Reduce lag
vim.o.lazyredraw = true
vim.o.synmaxcol = 240

-- Optimize GC
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

-- Garbage collection
vim.schedule(function()
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 200)
end)
-- Bootstrap lazy.nvim and load plugins
require("core.keymaps")
require("core.lazy")
require("lazy").setup("plugins")

-- Load core settings
require("core.options")
require("core.disable")
