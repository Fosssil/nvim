-- Global
vim.cmd("echo 'hello'")
print("hello")

-- Local
local x = 10

-- Readonly
local const = math.pi

-- Deprecated (if available)
vim.loop

---@deprecated
local function old()
end

old()
