local wezterm = require('wezterm')
local act = wezterm.action
local config = {}
config = wezterm.config_builder()
config.color_scheme = "Tomorrow Night Eighties"
config.keys = {
    {
        key = 'b',
        mods = 'CTRL',
        action = act.ActivateKeyTable {
            name = 'tmux',
            timout_milliseconds = 2000,
        }
    }
}
config.key_tables = {
    tmux = {
        { key = "c", action = act.SpawnTab 'CurrentPaneDomain' },
        { key = "Escape", action = 'PopKeyTable' },
        { key = "h", action = act.ActivateTabRelative(-1) },
        { key = "l", action = act.ActivateTabRelative(1) },

    }
}
for i = 1, 8 do
    table.insert(
        config.key_tables.tmux,
        { key = tostring(i), action = act.ActivateTab(i-1) }
    )
end

return config
