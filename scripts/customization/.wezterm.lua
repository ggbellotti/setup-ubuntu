local wezterm = require 'wezterm';

return {
  -- Fonts
  font = wezterm.font('JetBrains Mono'),
  -- font = wezterm.font_with_fallback('Fira Code'),
  font_size = 16.0,

  -- Colors
  color_scheme = "Dracula (Official)",

  -- Appearance
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  window_decorations = "TITLE | RESIZE",
  initial_rows = 24,
  initial_cols = 120,
}
