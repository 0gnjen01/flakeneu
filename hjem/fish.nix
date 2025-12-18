{pkgs, ...}: {
  programs.fish.enable = true;

  users.users.ignis.shell = pkgs.fish;

  hjem.users.ignis = {
    rum.programs.fish = {
      enable = true;
      config = ''
        set -g fish_greeting ""
      '';
    };
  };
}
