{lib, ...}: {
  imports = [
    ./browser
    ./nvidia
    ./selfhost
    ./nvf.nix
    ./thunar.nix
    ./zfs.nix
  ];
  nvf.enable = lib.mkDefault true;
  thunar.enable = lib.mkDefault true;
  zfs.enable = lib.mkDefault true;
}
