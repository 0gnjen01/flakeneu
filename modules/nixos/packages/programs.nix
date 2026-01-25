{pkgs, ...}: {
  programs = {
    nh = {
      enable = true;
      flake = "/home/ignis/flakeneu";
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
    };
    thunderbird = {
      enable = true;
    };
    obs-studio = {
      enable = true;
      plugins = [
        pkgs.obs-studio-plugins.wlrobs
      ];
    };
    yazi = {
      enable = true;
    };
    tmux = {
      enable = true;
      keyMode = "vi";
      clock24 = true;
    };
  };
}
