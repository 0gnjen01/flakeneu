{pkgs, ...}: {
  programs.fish.enable = true;

  users.users.ignis.shell = pkgs.fish;

  hjem.users.ignis = {
    rum.programs.fish = {
      enable = true;
      plugins = {
        inherit (pkgs.fishPlugins) z;
      };
      config = ''
        set -g fish_greeting ""
      '';
    };
  };
}
