-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

local function scheme_for_appearance(appearance)
    if appearance:find 'Dark' then
        return 'ayu'
    else
        return 'Ayu Mirage'
    end
end

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = scheme_for_appearance(get_appearance())


config.font = wezterm.font_with_fallback {
    { family = 'Iosevka NF', weight = 'Medium', italic = false },
    { family = 'Iosevka',    weight = 'Medium', italic = false },
    'Fira Code'
}

config.font_size = 13

-- Keyboard shortcuts
config.keys = {
    -- command palette
    { key = 'p', mods = 'CMD',       action = act.ActivateCommandPalette },
    -- New tab in home directory
    { key = 't', mods = 'CMD',       action = act.SpawnCommandInNewTab { domain = 'CurrentPaneDomain', cwd = "~" } },
    -- New tab in current working directory
    { key = 't', mods = 'CMD|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
    -- close panes rather than tabs
    { key = 'w', mods = 'CMD',       action = act.CloseCurrentPane { confirm = true } },
    { key = 'w', mods = 'CMD|SHIFT', action = act.CloseCurrentTab { confirm = true } },
    -- This will create a new split and run your default program inside it
    {
        key = 'd',
        mods = 'CMD',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- This will create a new split and run your default program inside it
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    { key = "LeftArrow",  mods = "OPT", action = act { SendString = "\x1bb" } },
    -- Make Option-Right equivalent to Alt-f; forward-word
    { key = "RightArrow", mods = "OPT", action = act { SendString = "\x1bf" } },

    -- Make CMD-Left move the cursor to the beggining of the line
    { key = "LeftArrow",  mods = "CMD", action = act.SendKey { key = 'a', mods = 'CTRL' } },

    -- Make CMD-Right move the cursor to the end of the line
    { key = "RightArrow", mods = "CMD", action = act.SendKey { key = 'e', mods = 'CTRL' } },

    -- full screen
    { key = 'Enter',      mods = 'CMD', action = act.ToggleFullScreen },


}
-- and finally, return the configuration to wezterm
return config
