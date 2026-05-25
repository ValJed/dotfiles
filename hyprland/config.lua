---@diagnostic disable: undefined-global

local mod = "SUPER"
local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun -show-icons"
local menuClip = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"
local menuEmoji = "rofi -modi emoji -show emoji"
local browser = "firefox"
local exec = hl.dsp.exec_cmd

-- ─── Autostart ────────────────────────────────────────────────────────────────

hl.on("hyprland.start", function()
	hl.exec_cmd("wbg ~/dotfiles/assets/wallpaper.png")
	hl.exec_cmd("dunst")
	hl.exec_cmd("waybar")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("[workspace 1 silent] " .. browser)
	hl.exec_cmd("[workspace 2 silent] kitty -e tmux new-session -A -s main")
	hl.exec_cmd("[workspace 3 silent] kitty -e tmux new-session -A -s code")
	hl.exec_cmd("[workspace 5 silent] spotify")
end)

-- ─── Environment ──────────────────────────────────────────────────────────────

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("TMUX_TMPDIR", os.getenv("XDG_RUNTIME_DIR") or "/run/user/1000")

-- ─── Config ───────────────────────────────────────────────────────────────────

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 1,
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
	input = {
		kb_layout = "us,",
		kb_variant = "altgr-intl,",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},
})

-- ─── Curves & Animations ──────────────────────────────────────────────────────

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- ─── Window Rules ─────────────────────────────────────────────────────────────

hl.window_rule({ name = "ws-discord", match = { class = "discord" }, workspace = 4 })
hl.window_rule({ name = "ws-slack", match = { class = "Slack" }, workspace = 4 })
hl.window_rule({ name = "ws-spotify", match = { class = "spotify" }, workspace = 5 })
hl.window_rule({ name = "ws-steam", match = { class = "steam" }, workspace = 5 })
hl.window_rule({ name = "ws-steamapp", match = { class = "^steam_app" }, workspace = 3 })
hl.window_rule({ name = "ws-cs2", match = { class = "cs2" }, workspace = 3 })
hl.window_rule({ name = "fs-cs2", match = { class = "cs2" }, fullscreen_state = 3 }) ------------------
hl.window_rule({ name = "fs-steamapp", match = { class = "^steam_app" }, fullscreen_state = 3 })

-- ─── Keybinds ─────────────────────────────────────────────────────────────────

-- Window management
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + T", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + W", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod .. " + A", hl.dsp.window.fullscreen())
hl.bind(mod .. " + backslash", exec("hyprlock"))

-- Launchers
hl.bind(mod .. " + D", exec(menu))
hl.bind(mod .. " + C", exec(menuClip))
hl.bind(mod .. " + E", exec(menuEmoji))
hl.bind(mod .. " + S", exec("~/dotfiles/scripts/rofi-sink.py"))
hl.bind(mod .. " + RETURN", exec(terminal))
hl.bind(mod .. " + F", exec(fileManager))
hl.bind(mod .. " + O", exec("obsidian"))
hl.bind(mod .. " + B", exec(browser))

-- Focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))

hl.bind(mod .. " + CTRL + H", hl.dsp.window.cycle_next({ direction = "prev" }))
hl.bind(mod .. " + CTRL + L", hl.dsp.window.cycle_next())

-- Move windows
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Screenshots
hl.bind("PRINT", exec("grim - | swappy -f -"))
hl.bind("SHIFT + PRINT", exec('grim -g "$(slurp -w 0)" - | wl-copy'))
hl.bind("CTRL + SHIFT + PRINT", exec('grim -g "$(slurp -w 0)" - | swappy -f -'))
hl.bind(mod .. " + PRINT", exec("record"))

-- Mouse window ops
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media
hl.bind("XF86AudioPlay", exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", exec("playerctl pause"), { locked = true })
hl.bind("XF86AudioNext", exec("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", exec("playerctl previous"), { locked = true })
hl.bind("XF86AudioRaiseVolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- ─── Resize Submap ────────────────────────────────────────────────────────────

hl.bind(mod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
end)
