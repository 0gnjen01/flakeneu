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
    p7zip
    ripgrep
    fd
    clang
  ];
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}
