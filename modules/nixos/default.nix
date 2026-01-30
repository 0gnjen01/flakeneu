{lib, ...}: {
  imports = [
    ./packages
    ./selfhost
    ./nvf.nix
    ./nvidia.nix
    ./thunar.nix
    ./zfs.nix
    ./default.nix
  ];
  nvf.enable = lib.mkDefault true;
  nvidia.enable = lib.mkDefault true;
  thunar.enable = lib.mkDefault true;
  zfs.enable = lib.mkDefault true;
}
