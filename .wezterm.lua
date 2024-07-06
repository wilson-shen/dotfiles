---@diagnostic disable: unused-local
local wezterm = require("wezterm")

-- always maximize
local mux = wezterm.mux

wezterm.on("gui-attached", function(domain)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

-- config
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- connect to wsl, comment this out if not on windows
-- config.wsl_domains = {
--     {
--         name = 'WSL:Ubuntu',
--         distribution = 'Ubuntu',
--         default_cwd = "~",
--     },
-- }
-- config.default_domain = 'WSL:Ubuntu'

config.font = wezterm.font("CodeNewRoman Nerd Font Mono")
config.font_size = 12.0
config.color_scheme = "Monokai (dark) (terminal.sexy)"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Gnome"
-- config.integrated_title_button_style = "MacOsNative"
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- keymaps
config.disable_default_key_bindings = false
config.keys = {
	{
		key = "C",
		mods = "CTRL",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
	{
		key = "V",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "t",
		mods = "CTRL|ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "CTRL|ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- background image
-- config.background = {
-- 	{
-- 		source = {
-- 			File = "/path/to/image",
-- 		},
-- 		repeat_x = "NoRepeat",
-- 		repeat_y = "NoRepeat",
-- 		hsb = {
-- 			hue = 1.0,
-- 			saturation = 1.0,
-- 			brightness = 0.3,
-- 		},
-- 	},
-- }

return config
