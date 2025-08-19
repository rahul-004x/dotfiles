-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#43f194",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
-- config.window_background_opacity = 0.75
config.macos_window_background_blur = 40
config.background = {
  {
    source = {
      File = wezterm.config_dir .. "/assets/bg-blurred-darker.png",
    },
    -- Optional: adjust opacity, alignment, repeat, etc.
    opacity = 0.75,
    width = "Cover",
    height = "Cover",
  },
}

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true

-- and finally, return the configuration to wezterm
return config
