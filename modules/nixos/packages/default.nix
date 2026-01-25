{lib, ...}: {
  imports = [
    ./packages.nix
    ./programs.nix
    ./services.nix
  ];
  packages.enable = lib.mkDefault true;
  programs.enable = lib.mkDefault true;
  services.enable = lib.mkDefault true;
}
