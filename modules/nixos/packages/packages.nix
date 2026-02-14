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
    fonts.packages = with pkgs; [
      twemoji-color-font
      nerd-fonts.dejavu-sans-mono
    ];
    environment.systemPackages = with pkgs; [
      vesktop
      lazygit
      fastfetch
      prismlauncher
      anki
      adwaita-icon-theme
      btop
      krita
      swayimg
      pavucontrol
      p7zip-rar
      qbittorrent
      fd
      eza
      clang
      signal-desktop-bin
      dino
      nextcloud-client
    ];
  };
}
