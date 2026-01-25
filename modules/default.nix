{lib, ...}: {
  imports = [
    ./hjem/default.nix
    ./nixos/default.nix
    ../secrets/sops.nix
  ];
  sops.enable = lib.mkDefault true;
}
