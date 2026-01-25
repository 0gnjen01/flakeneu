{lib, ...}: {
  imports = [
    ./adguard-home.nix
    ./cloudflare-dydns.nix
    ./docker.nix
    ./homepage.nix
    ./jellyfin.nix
    ./jellyfin.nix
    ./microbin.nix
    ./minecraft-docker.nix
    ./minecraft.nix
    ./nextcloud.nix
    ./nginx.nix
  ];
}
