{lib, ...}: {
  imports = [
    ./hjem.nix
    ./fish.nix
    ./foot.nix
    ./fuzzel.nix
    ./git.nix
    ./mpv.nix
    ./niri.nix
    ./noctalia.nix
    ./wlr-which-key.nix
  ];
  hjem.enable = lib.mkDefault true;
  fish.enable = lib.mkDefault true;
  foot.enable = lib.mkDefault true;
  fuzzel.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  mpv.enable = lib.mkDefault true;
  niri.enable = lib.mkDefault true;
  noctalia.enable = lib.mkDefault true;
  wlr-which-key.nix = lib.mkDefault true;
}
