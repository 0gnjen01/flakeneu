{...}: {
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
  };
}
