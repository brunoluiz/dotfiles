local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- UI rendering (font/spacing)
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.line_height = 1.3
config.cell_width = 0.9
config.font_size = 12.0

-- Window management
config.native_macos_fullscreen_mode = true
-- config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Mouse bindings
config.mouse_bindings = {
  -- Open URLs with CMD+Click
  { event = { Up = { streak = 1, button = "Left" } }, mods = "CMD", action = wezterm.action.OpenLinkAtMouseCursor },
}

-- Key bindings
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 }
config.keys = {
  -- tmux compatible keybindings
  { key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  { key = "|", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  { key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "o", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
  { key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
  { key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
  { key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
  { key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 25 } }) },
  { key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 25 } }) },
  { key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 25 } }) },
  { key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 25 } }) },
  { key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
  { key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
  { key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
  { key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
  { key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
  { key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
  { key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
  { key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
  { key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
  { key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
  { key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
  { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
}

-- and finally, return the configuration to wezterm
return config
