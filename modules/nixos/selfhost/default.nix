{lib, ...}: {
  imports = [
    ./cloudflare.nix
    ./microbin.nix
    ./minecraft.nix
    ./nextcloud.nix
    ./nginx.nix
  ];
  cloudflare.enable = lib.mkDefault false;
  microbin.enable = lib.mkDefault false;
  minecraft.enable = lib.mkDefault false;
  nextcloud.enable = lib.mkDefault false;
  nginx.enable = lib.mkDefault false;
}
