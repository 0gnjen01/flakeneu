{lib, ...}: {
  imports = [
    ./librewolf.nix
  ];
  librewolf.enable = lib.mkDefault true;
}
