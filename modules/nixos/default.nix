{lib, ...}: {
  imports = [
    ./browser
    ./nvidia
    ./packages
    ./selfhost
    ./nvf.nix
    ./thunar.nix
    ./zfs.nix
  ];
  nvf.enable = lib.mkDefault true;
  thunar.enable = lib.mkDefault true;
  zfs.enable = lib.mkDefault true;
}
