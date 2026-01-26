{lib, ...}: {
  imports = [
    ./hjem.nix
    ./firefox.nix
    ./fish.nix
    ./foot.nix
    ./fuzzel.nix
    ./git.nix
    ./mako.nix
    ./mpv.nix
    ./niri.nix
    ./yambar.nix
  ];
  hjem.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
  fish.enable = lib.mkDefault true;
  foot.enable = lib.mkDefault true;
  fuzzel.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  mako.enable = lib.mkDefault true;
  mpv.enable = lib.mkDefault true;
  niri.enable = lib.mkDefault true;
  yambar.enable = lib.mkDefault true;
}
