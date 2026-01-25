{lib, ...}: {
  imports = [
    ./hjem
    ./nixos
    ../secrets/sops.nix
  ];
  sops.enable = lib.mkDefault true;
}
