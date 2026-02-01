{lib, ...}: {
  imports = [
    ./hjem
    ./nixos
    ../secrets/sops.nix
  ];
  sops-nix.enable = lib.mkDefault true;
}
