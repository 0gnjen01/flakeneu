{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    lazygit
    microfetch
    prismlauncher
    anki
    btop
    zathura
    krita
    swayimg
    pavucontrol
    p7zip-rar
    wineWowPackages.waylandFull
    winetricks
    fd
  ];
}
