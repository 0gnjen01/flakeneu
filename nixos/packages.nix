{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    nerd-fonts._0xproto
  ];
}
