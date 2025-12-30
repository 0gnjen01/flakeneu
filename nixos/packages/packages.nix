{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    lazygit
    microfetch
    prismlauncher
    anki
    btop
    krita
    pavucontrol
    yazi
    p7zip-rar
    wineWowPackages.waylandFull
    winetricks
    fd
  ];
}
