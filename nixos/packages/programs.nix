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
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
      ];
    };
  };
}
