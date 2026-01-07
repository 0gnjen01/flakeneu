{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    lazygit
    microfetch
    prismlauncher
    anki
    dino
    adwaita-icon-theme
    btop
    zathura
    krita
    swayimg
    pavucontrol
    p7zip-rar
    qbittorrent
    wineWowPackages.waylandFull
    winetricks
    fd
  ];
}
