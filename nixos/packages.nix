{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    nerdfonts.fonts._0xproto
  ];
}
