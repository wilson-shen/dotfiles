local wezterm = require('wezterm')

-- always maximize
local mux = wezterm.mux

wezterm.on('gui-attached', function(domain)
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

-- connect to wsl
config.wsl_domains = {
    {
        name = 'WSL:Ubuntu',
        distribution = 'Ubuntu',
        default_cwd = "~",
    },
}
config.default_domain = 'WSL:Ubuntu'

-- font & theme
config.font = wezterm.font('CodeNewRoman Nerd Font Mono')
config.color_scheme = 'Monokai (dark) (terminal.sexy)'

-- keymaps
config.disable_default_key_bindings = false
config.keys = {
    {
        key = 'C',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
    },
    {
        key = 'V',
        mods = 'CTRL',
        action = wezterm.action.PasteFrom 'Clipboard'
    },
    {
        key = 't',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'w',
        mods = 'CTRL|ALT',
        action = wezterm.action.CloseCurrentTab { confirm = true },
    },

}
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL|ALT',
        action = wezterm.action.ActivateTab(i - 1),
    })
end

-- no system beep sound
config.audible_bell = 'Disabled'

-- background image
config.background = {
    {
        source = {
            File = "C:\\Users\\SHEN\\Desktop\\SHEN\\pokemon.gif"
        },
        repeat_x = "NoRepeat",
        repeat_y = "NoRepeat",
        hsb = {
            hue = 1.0,
            saturation = 1.0,
            brightness = 0.3,
        }

    }
}

-- exit without prompt
config.window_close_confirmation = 'NeverPrompt'

return config
