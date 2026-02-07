{lib, ...}: {
  imports = [
    ./nvidia-prime.nix
    ./nvidia.nix
  ];
  nvidia.enable = lib.mkDefault true;
  nvidia-prime.enable = lib.mkDefault false;
}
