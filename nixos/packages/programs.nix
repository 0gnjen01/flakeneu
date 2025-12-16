{...}:{
  programs = {
    nh = {
      enable = true;
      flake = "/home/ignis/flakeneu";
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
    firefox = {
      enable = true;
    };
  };
}
