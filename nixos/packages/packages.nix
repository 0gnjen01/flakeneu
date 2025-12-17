{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop
    lazygit
    microfetch
  ];
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}
