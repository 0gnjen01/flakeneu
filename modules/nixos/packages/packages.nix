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
    ];
  };
}
