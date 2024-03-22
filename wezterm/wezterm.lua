-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
-- local config = wezterm.config_builder()
local config = {
  font_size = 12,
  font = wezterm.font_with_fallback {
    -- 'Fira Code',
    'FiraCode Nerd Font Mono',
    'DengXian',
  },
  -- color_scheme = "GruvboxDarkHard",
  -- color_scheme = 'Google (dark) (terminal.sexy)',
  color_scheme = 'Guezwhoz',

  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = true,
  window_background_opacity = 0.9,
  -- macos_window_background_blur = 70,

  adjust_window_size_when_changing_font_size = false,
  text_background_opacity = 0.9,
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  }
}

-- and finally, return the configuration to wezterm
return config
