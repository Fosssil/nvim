--------------------------------------------------------------------------------
-- Comments
--------------------------------------------------------------------------------

-- Single line comment

--- Documentation comment

-- TODO: Improve parser
-- NOTE: Theme philosophy
-- WARNING: Experimental feature

vim.notify("Hello")

local cwd = vim.fn.getcwd()

local path = vim.fs.joinpath("a", "b")

print(vim.inspect(config))

--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------

local name = "Nocturne"
local version = "0.1.0"

local width = 1920
local height = 1080

local is_enabled = true
local opacity = 0.95
local value = nil

--------------------------------------------------------------------------------
-- Tables
--------------------------------------------------------------------------------

local config = {
	ui = {
		border = "rounded",
		opacity = 0.95,
		padding = 6,
	},

	animations = {
		enabled = true,
		duration = 150,
	},

	palette = {
		primary = "#8DB8FF",
		accent = "#C7A8F9",
	},

	[1] = "One",
	["theme"] = "Nocturne",
}

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------

local function greet(user, message)
	print(user, message)
end

greet("Sagar", "Hello")

local function merge(left, right)
	return left .. right
end

local callback = function(v)
	return v * 2
end

--------------------------------------------------------------------------------
-- Window Class
--------------------------------------------------------------------------------

---@class Window
local Window = {}

local DEFAULT_OPACITY = 0.95

function Window:new(cfg)
	local instance = {
		title = "Nocturne",
		width = 1280,
		height = 720,
		visible = true,
		opacity = DEFAULT_OPACITY,
		config = cfg,
	}

	setmetatable(instance, self)
	self.__index = self

	return instance
end

function Window:resize(new_width, new_height)
	if new_width <= 0 or new_height <= 0 then
		error("Invalid size")
	end

	self.width = new_width
	self.height = new_height

	return true
end

local window = Window:new(config)
window:resize(1200, 800)

--------------------------------------------------------------------------------
-- Control Flow
--------------------------------------------------------------------------------

if config.animations.enabled then
	for i = 1, 10 do
		print(i)
	end
else
	return
end

while opacity > 0 do
	opacity = opacity - 0.1
end

repeat
	width = width - 1
until width == 0

for key, val in pairs(config) do
	print(key, val)
end

for index, item in ipairs({ "a", "b", "c" }) do
	print(index, item)
end

--------------------------------------------------------------------------------
-- Operators
--------------------------------------------------------------------------------

local a = 10
local b = 5
local c = 2

a = b + c
a = b - c
a = b * c
a = b / c
a = b % c
a = b ^ c
a = merge("Noct", "urne")

if a >= b and b ~= c then
	print("ok")
end

--------------------------------------------------------------------------------
-- Numbers
--------------------------------------------------------------------------------

local integer = 255
local hex = 0xff
local scientific = 1e5
local negative = -42
local pi = 3.14159

--------------------------------------------------------------------------------
-- Strings
--------------------------------------------------------------------------------

local single = "single quote"
local double = "double quote"

local multiline = [[
Nocturne
is
alive.
]]

local escaped = "Hello\nWorld"

--------------------------------------------------------------------------------
-- Properties
--------------------------------------------------------------------------------

config.ui.border = "solid"
config.palette.primary = "#FFFFFF"

local color = config.palette.primary

--------------------------------------------------------------------------------
-- Function Calls
--------------------------------------------------------------------------------

print(string.upper("nocturne"))
print(math.max(1, 2, 3))

--------------------------------------------------------------------------------
-- Error Handling
--------------------------------------------------------------------------------

local ok, err = pcall(function()
	error("Failure")
end)

print(ok, err)

--------------------------------------------------------------------------------
-- Closures
--------------------------------------------------------------------------------

local function counter()
	local count = 0

	return function()
		count = count + 1
		return count
	end
end

local next_value = counter()

print(next_value())
print(next_value())

--------------------------------------------------------------------------------
-- EmmyLua
--------------------------------------------------------------------------------

---@class Theme
---@field colors table
---@field syntax table

---@param opts table
---@return Theme
