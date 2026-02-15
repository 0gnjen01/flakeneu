{lib, ...}: {
  imports = [
    ./cloudflare-dyndns.nix
    ./microbin.nix
    ./minecraft.nix
    ./nextcloud.nix
    ./nginx.nix
    ./searx.nix
    ./prosody.nix
  ];
  cloudflare-dyndns.enable = lib.mkDefault false;
  microbin.enable = lib.mkDefault false;
  minecraft.enable = lib.mkDefault false;
  nextcloud.enable = lib.mkDefault false;
  nginx.enable = lib.mkDefault false;
  searx.enable = lib.mkDefault false;
  prosody.enable = lib.mkDefault false;
}
