{pkgs, ...}: {
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
    sops
    obsidian
  ];
}
