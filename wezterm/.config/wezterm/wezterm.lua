local wezterm = require("wezterm")

local config = wezterm.config_builder()

--[[ config.color_scheme = "Red Phoenix (terminal.sexy)" ]]
--[[ config.color_scheme = "Color Star (terminal.sexy)" ]]
--[[ config.color_scheme = "Dark Ocean (terminal.sexy)" ]]
--[[ config.color_scheme = "JWR dark (terminal.sexy)" ]]
--[[ config.color_scheme = "Dark Violet (base16)" ]]
config.color_scheme = "FarSide (terminal.sexy)"
config.color_scheme = "Cloud (terminal.sexy)"

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font",
	"Hack Nerd Font",
	"DejaVu Sans Mono",
})

local cmd = "xrandr | grep '*' | awk '{print $1}'"
local handle = io.popen(cmd)
if handle ~= nil then
	local resolution = handle:read("*a")
	handle:close()
	local width = tonumber(resolution.sub(resolution, 1, 4))
	if width > 2000 then
		config.font_size = 13.0
	elseif width > 1600 then
		config.font_size = 11.0
	end
else
	config.font_size = 12.0
end

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.default_cursor_style = "BlinkingBar"
config.warn_about_missing_glyphs = false

config.keys = {
	{ key = "p", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "d", mods = "CTRL|SHIFT", action = wezterm.action.ShowDebugOverlay },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
}

config.default_prog = { "/usr/bin/zsh" }

return config
