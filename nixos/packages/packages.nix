{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    lazygit
    microfetch
    prismlauncher
    anki
    btop
  ];
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}
