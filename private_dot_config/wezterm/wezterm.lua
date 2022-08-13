local wezterm = require 'wezterm'

return {
  color_scheme = 'OneDark-Pro',
  font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'JetBrains Mono'
  },
  font_size = 12,
  default_cursor_style = 'BlinkingBar',
  cursor_blink_rate = 500,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  initial_cols = 120,
  initial_rows = 30,
  window_padding = {
    left = '3px',
    right = '3px',
    top = '3px',
    bottom = '3px'
  }
}
