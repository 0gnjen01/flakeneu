{
  config,
  lib,
  pkgs,
  ...
}: {
  options.packages = {
    enable = lib.mkEnableOption "enables packages";
  };

  config = lib.mkIf config.packages.enable {
    environment.systemPackages = with pkgs; [
      vesktop
      lazygit
      microfetch
      prismlauncher
      anki
      gajim
      adwaita-icon-theme
      btop
      krita
      swayimg
      pavucontrol
      p7zip-rar
      qbittorrent
      wineWowPackages.waylandFull
      winetricks
      fd
      eza
      gcc
    ];
  };
}
