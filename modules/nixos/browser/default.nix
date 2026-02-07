{lib, ...}: {
  imports = [
    ./librewolf.nix
    ./searx.nix
  ];
  librewolf.enable = lib.mkDefault true;
  searx.enable = lib.mkDefault false;
}
