{pkgs, ...}: {
  enviroment.systemPackages = with pkgs; [
    wezterm
  ];
  hjem.users.ignis = {
    xdg.config.files."wezterm/wezterm.lua".text = ''
      local wezterm = require 'wezterm'

      local config = wezterm.config_builder()

      config.initial_cols = 120
      config.initial_rows = 28

      config.font_size = 10
      config.color_scheme_dirs = {'~/.config/wezterm/kanso_mist.lua'}

      return config
    '';
    xdg.config.files."wezterm/kanso_mist.lua".text = ''
      local config = {
          force_reverse_video_cursor = true,
          colors = {
              foreground = "#C5C9C7",
              background = "#22262D",

              cursor_bg = "#C5C9C7",
              cursor_fg = "#22262D",
              cursor_border = "#C5C9C7",

              selection_fg = "#C5C9C7",
              selection_bg = "#43464E",

              scrollbar_thumb = "#43464E",
              split = "#43464E",

              ansi = {
                  "#22262D",
                  "#C4746E",
                  "#8A9A7B",
                  "#C4B28A",
                  "#8BA4B0",
                  "#A292A3",
                  "#8EA4A2",
                  "#a4a7a4",
              },
              brights = {
                  "#5C6066",
                  "#E46876",
                  "#87A987",
                  "#E6C384",
                  "#7FB4CA",
                  "#938AA9",
                  "#7AA89F",
                  "#C5C9C7",
              },
          },
      }

      return config
    '';
  };
}
