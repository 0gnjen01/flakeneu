{lib, ...}: {
  imports = [
    ./packages
    ./selfhost
    ./nvf.nix
    ./nvidia.nix
    ./nvidia-prime.nix
    ./thunar.nix
    ./zfs.nix
  ];
  nvf.enable = lib.mkDefault true;
  nvidia.enable = lib.mkDefault true;
  nvidia-prime.enable = lib.mkDefault false;
  thunar.enable = lib.mkDefault true;
  zfs.enable = lib.mkDefault true;
}
