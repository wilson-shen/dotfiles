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

config = {
	automatically_reload_config = true,
	audible_bell = "Disabled",
	background = {
		{
			source = {
				File = "/path/to/image",
			},
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			hsb = {
				hue = 1.0,
				saturation = 1.0,
				brightness = 0.15,
			},
			horizontal_align = "Center",
		},
	},
	color_scheme = "Monokai (dark) (terminal.sexy)",
	disable_default_key_bindings = true,
	enable_tab_bar = true,
	font = wezterm.font("CodeNewRoman Nerd Font Mono"),
	font_size = 12.0,
	integrated_title_button_style = "Gnome",
	keys = {
		{
			key = "C",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
		},
		{
			key = "V",
			mods = "CTRL|SHIFT",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
		{
			key = "t",
			mods = "SUPER",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "w",
			mods = "SUPER",
			action = wezterm.action.CloseCurrentTab({ confirm = false }),
		},
	},
	window_close_confirmation = "NeverPrompt",
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "SUPER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
