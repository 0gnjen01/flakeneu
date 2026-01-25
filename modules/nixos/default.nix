{lib, ...}: {
  imports = [
    ./packages
    ./selfhost
    ./nvf/nvf.nix
    ./nvidia.nix
    ./thunar.nix
    ./zfs.nix
  ];
  nvf.enable = lib.mkDefault true;
  nvidia.enable = lib.mkDefault true;
  thunar.enable = lib.mkDefault true;
  zfs.enable = lib.mkDefault true;
}
