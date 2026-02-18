{lib, ...}: {
  imports = [
    ./cloudflare.nix
    ./microbin.nix
    ./minecraft.nix
    ./nextcloud.nix
    ./nginx.nix
    ./forgejo.nix
    ./immich.nix
  ];
  cloudflare.enable = lib.mkDefault false;
  microbin.enable = lib.mkDefault false;
  minecraft.enable = lib.mkDefault false;
  nextcloud.enable = lib.mkDefault false;
  nginx.enable = lib.mkDefault false;
  forgejo.enable = lib.mkDefault false;
  immich.enable = lib.mkDefault false;
}
